open Utils
open Types
open Lwt.Syntax

type type_ =
  | Query (* GET *)
  | Procedure (* POST *)

module Error = struct
  type t =
    { error : string;
      message : string option [@yojson.option]
    } [@@deriving yojson]

  let pp = pp_as_json yojson_of_t
end

module Client = struct
  module type S = Cohttp_lwt.S.Client
  type t = (module S)
end

module Conn = struct
  module type Client = Cohttp_lwt.S.Client

  type t = {
    client : Client.t;
    host : string;
  }

  let create client host = { client; host }

  let make_uri t nsid =
    Uri.of_string @@ Printf.sprintf "https://%s/xrpc/%s" t.host @@ Nsid.to_string nsid

  let get t =
    let (module Client) = t.client in
    Client.get ?ctx:None

  let post t =
    let (module Client) = t.client in
    Client.post ?ctx:None
end

let http_param conv (n : string) x = [n, (conv x : string)]

let http_param_opt conv n x =
  match x with
  | None -> []
  | Some x -> http_param conv n x

let http_params ps = List.flatten ps

let header_json = ("Content-Type", "application/json")

let header_auth session = ("Authorization", "Bearer " ^ session.Session.accessJwt)

let ok_or_fail resp body conv =
  match resp.Cohttp.Response.status with
  | `OK ->
      let* body = Cohttp_lwt.Body.to_string body in
      Lwt.return @@ of_yojson_string conv body
  | _ ->
      Format.eprintf "@[<2>HTTP error@ @[%a@]@]@." Cohttp.Response.pp_hum resp;
      let* body = Cohttp_lwt.Body.to_string body in
      prerr_endline body;
      Lwt.return @@
      match of_yojson_string Error.t_of_yojson body with
      | Error _ ->
          Error (`HTTP_failure (resp, Error.{ error = body;
                                              message = Some "error json parse failed" }))
      | Ok e -> Error (`HTTP_failure (resp, e))

let make_http_headers accessJwt : Cohttp.Header.t =
  Cohttp.Header.of_list
    ( header_json ::
      match accessJwt with
      | None -> []
      | Some accessJwt -> [ header_auth accessJwt ])

(* GET *)
module Query(A : sig
    val nsid : Nsid.t
    type resp [@@deriving yojson]
  end) = struct
  include A

  let f conn ?session params =
    let uri = Conn.make_uri conn nsid in
    let uri = Uri.add_query_params' uri params in
    let headers = make_http_headers session in
    let* resp, body = Conn.get conn ~headers uri in
    ok_or_fail resp body resp_of_yojson
end

module type QueryIntf = sig
  val nsid : Nsid.t
  type resp [@@deriving yojson]
end

(* GET *)
let query (type resp) (module Intf : QueryIntf with type resp = resp) conn ?session params =
  let uri = Conn.make_uri conn Intf.nsid in
  let uri = Uri.add_query_params' uri params in
  let headers = make_http_headers session in
  let* resp, body = Conn.get conn ~headers uri in
  ok_or_fail resp body Intf.resp_of_yojson

module type ProcedureIntf = sig
  val nsid : Nsid.t
  type param [@@deriving yojson]
  type resp [@@deriving yojson]
end

(* POST *)
let procedure (type resp) (type param) (module Intf : ProcedureIntf with type resp = resp and type param = param) conn ?session param =
  let uri = Conn.make_uri conn Intf.nsid in
  let headers = make_http_headers session in
  let body : Cohttp_lwt.Body.t =
    `String (Yojson.Safe.to_string @@ Intf.yojson_of_param param)
  in
  Format.eprintf "body: %s@." (Yojson.Safe.to_string @@ Intf.yojson_of_param param);
  let* resp, body = Conn.post conn ~headers ~body uri in
  ok_or_fail resp body Intf.resp_of_yojson

module ResolveHandle = struct
  module Intf = struct
    let nsid = Nsid.unsafe_of_string "com.atproto.identity.resolveHandle"
    type resp = { did : Did.t } [@@deriving yojson]
  end

  include Intf

  let f conn handle =
    let params =
      http_params
        [ http_param Fun.id "handle" handle ]
    in
    query (module Intf) conn params
end

module CreateSession = struct
  module Intf = struct
    let nsid = Nsid.unsafe_of_string "com.atproto.server.createSession"
    type resp = Session.t [@@deriving yojson]
    type param = Credential.t [@@deriving yojson]
  end

  include Intf

  let f conn ~identifier ~password =
    let param = Credential.{ identifier; password } in
    procedure (module Intf) conn param
end

let check_limit max limit =
  let limit' = Option.value limit ~default:max in
  if 1 <= limit' && limit' <= max then ()
  else invalid_arg "limit"

(* https://atproto.com/lexicons/app-bsky-feed#appbskyfeedgetauthorfeed *)
module GetAuthorFeed = struct
  module Intf = struct
    let nsid = Nsid.unsafe_of_string "app.bsky.feed.getAuthorFeed"
    type feed_item = Feed.feedViewPost [@@deriving yojson]

    type feed = feed_item list [@@deriving yojson]

    type resp =
      { feed : feed;
        cursor : string option [@yojson.option]
      } [@@deriving yojson]
  end

  include Intf

  let f conn ~actor ?limit ?cursor session =
    check_limit 100 limit;
    let params =
      http_params [ http_param Fun.id "actor" actor; (* TODO at-identifier *)
                    http_param_opt string_of_int "limit" limit;
                    http_param_opt Fun.id "cursor" cursor ]
    in
    query (module Intf) conn ~session params
end

module GetTimeline = struct
  module Intf = struct
    let nsid = Nsid.unsafe_of_string "app.bsky.feed.getTimeline"

    type feed_item = Feed.feedViewPost [@@deriving yojson]

    type resp = {
      feed : feed_item list;
      cursor : string option [@yojson.option]
    } [@@deriving yojson]

    type param =
      { algorithm : string;
        limit : int;
        cursor : string
      } [@@deriving yojson]
  end

  include Intf

  let f conn ?algorithm ?limit ?cursor session =
    check_limit 100 limit;
    let params =
      http_params
        [ http_param_opt Fun.id "algorithm" algorithm;
          http_param_opt string_of_int "limit" limit;
          http_param_opt Fun.id "cursor" cursor ]
    in
    query (module Intf) conn ~session params
end

module CreateRecord = struct
  module Intf = struct
    let nsid = Nsid.unsafe_of_string "com.atproto.repo.createRecord"

    type param =
      { repo : string (* TODO at-identifier *);
        collection : Nsid.t;
        record : Unknown.t;

        rkey : string option [@yojson.option];
        validate : bool option [@yojson.option] (* default= true *);
        swapCommit : Cid.t option [@yojson.option];
      } [@@deriving yojson]

    type resp =
      { uri : Aturi.t;
        cid : Cid.t;
      } [@@deriving yojson]
  end

  include Intf

  let f conn ~collection ~record session =
    let param =
      { repo = Did.to_string session.Session.did (* Handle.to_string session.Session.handle *);
          collection; record;
        rkey = None; validate = None; swapCommit = None }
    in
    procedure (module Intf) conn ~session param
end

module Post = struct
  type record =
    { text : string;
      createdAt : string (* RFC3339 *)
    } [@@deriving yojson]

  let f conn ~text ?createdAt (* ?facets ?reply ?embed *) session =
    let createdAt = Option.value createdAt ~default:(Ptime_clock.now ()) in
    let createdAt = Ptime.to_rfc3339 ~tz_offset_s:0 createdAt in
    let record = { text; createdAt } in
    let record = yojson_of_record record in
    CreateRecord.f conn ~collection:(Nsid.unsafe_of_string "app.bsky.feed.post") ~record session
end

module Like = struct

  type record =
    { subject: Repo.strongRef;
      createdAt : string (* RFC3339 *);
      type_: string [@key "$type"] (* "$type": "app.bsky.feed.like" *)
    } [@@deriving yojson]

  let f client ~subject ?createdAt session =
    let createdAt = Option.value createdAt ~default:(Ptime_clock.now ()) in
    let createdAt = Ptime.to_rfc3339 ~tz_offset_s:0 createdAt in
    let record = { subject; createdAt; type_ = "app.bsky.feed.like" } in
    let record = yojson_of_record record in
    CreateRecord.f client ~collection:(Nsid.unsafe_of_string "app.bsky.feed.like") ~record session
end

(* This is NOT an XRPC *)
module Search = struct
  let base_url = "https://search.bsky.social/search"
  let entrypoint = "posts"
  let uri = Uri.of_string @@ base_url ^/ entrypoint

  type user =
    { did : string;
      handle : string;
    } [@@deriving yojson]

  (* createdAt:    1687367811_445000000
     gettimeofday: 1688473984.42762494
  *)
  type post =
    { createdAt : int64;
      text : string;
      user : string;
    } [@@deriving yojson]

  type post_found =
    { tid : string;
      cid : Cid.t;
      user : user;
      post : post;
    } [@@deriving yojson]

  type resp = post_found list [@@deriving yojson]

  let posts (module Client : Conn.Client) q =
    let uri =
      Uri.add_query_params' uri
        [ "q", q ]
    in
    let* resp, body = Client.get uri in
    ok_or_fail resp body resp_of_yojson
end
