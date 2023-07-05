open Lwt.Syntax

type error =
  [ `Decode_failure of exn
  | `HTTP_failure of Cohttp.Response.t * string
  | `Exn of exn
  ]

type 'a monad = ('a, error) result Lwt.t

let (^/) = Filename.concat

let decode f j =
  try Ok (f j) with e ->
    Format.eprintf "@[<2>Decode failure@ @[%a@]@]@."
      (Yojson.Safe.pretty_print ~std:false) j;
    Error (`Decode_failure e)

let ok_or_fail resp body f =
  match resp.Cohttp.Response.status with
  | `OK ->
      let* body = Cohttp_lwt.Body.to_string body in
      let j = Yojson.Basic.from_string body in
      let j = (j :> Yojson.Safe.t) in
      Lwt.return @@ decode f j
  | _ ->
      Format.eprintf "HTTP %a@." Cohttp.Response.pp_hum resp;
      let* body = Cohttp_lwt.Body.to_string body in
      Format.eprintf "BODY %s@." body;
      Lwt.return_error (`HTTP_failure (resp, body))

let http_param conv (n : string) x = [n, (conv x : string)]

let http_param_opt conv n x =
  match x with
  | None -> []
  | Some x -> http_param conv n x

let add_http_params uri ps =
  Uri.add_query_params' uri @@ List.flatten ps

module type Client = Cohttp_lwt.S.Client
type client = (module Client)

module Handle = Handle

(* Insecure! *)
module Credential = struct
  type t =
    { identifier : string;
      password : string;
    } [@@deriving yojson]

  let load fn =
    try
      Ok (t_of_yojson @@ Yojson.Safe.from_file fn)
    with
    | e -> Error (`Exn e)
end

module Bsky_social = struct
  let base_url = "https://bsky.social/xrpc"
end

module ResolveHandle = struct
  include Bsky_social
  let entrypoint = "com.atproto.identity.resolveHandle"
  let uri = Uri.of_string @@ base_url ^/ entrypoint

  type resp = { did : string } [@@deriving yojson]

  let pp ppf resp = Yojson.Safe.pretty_print ppf @@ yojson_of_resp resp

  let f (module Client : Client) handle =
    let uri =
      add_http_params uri [ http_param Fun.id "handle" handle ]
    in
    let* resp, body = Client.get uri in
    ok_or_fail resp body resp_of_yojson
end

let header_json = ("Content-Type", "application/json")

module CreateSession = struct
  include Bsky_social
  let entrypoint = "com.atproto.server.createSession"
  let uri = Uri.of_string @@ base_url ^/ entrypoint

  type resp =
    { did : string;
      handle : string;
      email : string;
      accessJwt : string;
      refreshJwt : string
    } [@@deriving yojson]

  type param =
    { identifier : string;
      password : string;
    } [@@deriving yojson]

  let pp ppf resp = Yojson.Safe.pretty_print ppf @@ yojson_of_resp resp

  let f (module Client : Client) ~identifier ~password =
    let headers : Cohttp.Header.t =
      Cohttp.Header.of_list [ header_json ]
    in
    let param = { identifier; password } in
    let body : Cohttp_lwt.Body.t =
      `String (Yojson.Safe.to_string @@ yojson_of_param param)
    in
    let* resp, body = Client.post ~headers ~body uri in
    ok_or_fail resp body resp_of_yojson
end

type session = CreateSession.resp

let header_session session =
  "Authorization", "Bearer " ^ session.CreateSession.accessJwt

let check_limit max limit =
  let limit' = Option.value limit ~default:max in
  if 1 <= limit' && limit' <= max then ()
  else invalid_arg "limit"

module GetAuthorFeed = struct
  include Bsky_social
  let entrypoint = "app.bsky.feed.getAuthorFeed"
  let uri = Uri.of_string @@ base_url ^/ entrypoint

  type resp = Yojson.Safe.t

  let resp_of_yojson j = j
  let yojson_of_resp j = j

  let pp ppf (resp : resp) = Yojson.Safe.pretty_print ppf @@ yojson_of_resp resp

  let f (module Client : Client) ~actor ?limit ?cursor (session : session) =
    check_limit 100 limit;
    let uri =
      add_http_params uri
        [ http_param Fun.id "actor" actor;
          http_param_opt string_of_int "limit" limit;
          http_param_opt Fun.id "cursor" cursor ]
    in
    let headers : Cohttp.Header.t =
      Cohttp.Header.of_list
        [ header_json;
          header_session session
        ]
    in
    let* resp, body = Client.get ~headers uri in
    ok_or_fail resp body resp_of_yojson
end

module GetTimeline = struct
  include Bsky_social
  let entrypoint = "app.bsky.feed.getTimeline"
  let uri = Uri.of_string @@ base_url ^/ entrypoint

  type postView = Yojson.Safe.t
  let postView_of_yojson j = j
  let yojson_of_postView j = j

  type reply = Yojson.Safe.t
  let reply_of_yojson j = j
  let yojson_of_reply j = j

  type reason = Yojson.Safe.t
  let reason_of_yojson j = j
  let yojson_of_reason j = j

  type feed_item = {
    post : postView;
    reply : reply option [@yojson.option];
    reason : reason option [@yojson.option]
  } [@@deriving yojson]

  type resp = {
    feed : feed_item list;
    cursor : string option [@yojson.option]
  } [@@deriving yojson]

  let pp ppf (resp : resp) = Yojson.Safe.pretty_print ppf @@ yojson_of_resp resp

  type param =
    { algorithm : string;
      limit : int;
      cursor : string
    } [@@deriving yojson]

  let f (module Client : Client) ?algorithm ?limit ?cursor (session : session) =
    check_limit 100 limit;
    let uri =
      add_http_params uri
        [ http_param_opt Fun.id "algorithm" algorithm;
          http_param_opt string_of_int "limit" limit;
          http_param_opt Fun.id "cursor" cursor ]
    in
    let headers : Cohttp.Header.t =
      Cohttp.Header.of_list
        [ header_json;
          header_session session
        ]
    in
    let* resp, body = Client.get ~headers uri in
    ok_or_fail resp body resp_of_yojson
end

module CreateRecord = struct
  include Bsky_social
  let entrypoint = "com.atproto.repo.createRecord"
  let uri = Uri.of_string @@ base_url ^/ entrypoint

  type resp =
    { uri : string;
      cid : string
    } [@@deriving yojson]

  let pp ppf x = Yojson.Safe.pretty_print ppf @@ yojson_of_resp x

  type record = Yojson.Safe.t
  let record_of_yojson j = j
  let yojson_of_record j = j

  type param =
    { repo : string;
      collection : string;
      record : record
    } [@@deriving yojson]

  let f (module Client : Client) ~collection ~record (session : session) =
    let headers : Cohttp.Header.t =
      Cohttp.Header.of_list
        [ header_json;
          header_session session
        ]
    in
    let param = { repo = session.handle; collection; record } in
    let jparam = yojson_of_param param in
    (* Format.eprintf "%a@." (Yojson.Safe.pretty_print ~std:false) jparam; *)
    let body : Cohttp_lwt.Body.t = `String (Yojson.Safe.to_string @@ jparam) in
    let* resp, body = Client.post ~headers ~body uri in
    ok_or_fail resp body resp_of_yojson
end

module Post = struct
  type record =
    { text : string;
      createdAt : string (* RFC3339 *)
    } [@@deriving yojson]

  let f client ~text ?createdAt (* ?facets ?reply ?embed *) (session : session) =
    let createdAt = Option.value createdAt ~default:(Ptime_clock.now ()) in
    let createdAt = Ptime.to_rfc3339 ~tz_offset_s:0 createdAt in
    let record = { text; createdAt } in
    let record = yojson_of_record record in
    CreateRecord.f client ~collection:"app.bsky.feed.post" ~record session
end

module Like = struct

  type record =
    { subject: CreateRecord.resp;
      createdAt : string (* RFC3339 *)
    } [@@deriving yojson]

  let f client ~subject ?createdAt (session : session) =
    let createdAt = Option.value createdAt ~default:(Ptime_clock.now ()) in
    let createdAt = Ptime.to_rfc3339 ~tz_offset_s:0 createdAt in
    let record = { subject; createdAt } in
    let record = yojson_of_record record in
    CreateRecord.f client ~collection:"app.bsky.feed.like" ~record session
end


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
      cid : string;
      user : user;
      post : post;
    } [@@deriving yojson]

  type resp = post_found list [@@deriving yojson]

  let pp ppf (resp : resp) =
    Yojson.Safe.pretty_print ppf @@ yojson_of_resp resp

  let posts (module Client : Client) q =
    let uri =
      Uri.add_query_params' uri
        [ "q", q ]
    in
    let* resp, body = Client.get uri in
    ok_or_fail resp body resp_of_yojson
end
