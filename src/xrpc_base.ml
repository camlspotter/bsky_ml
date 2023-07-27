open Bsky_ml_base.Utils
open Bsky_ml_base.Types
module Credential = Bsky_ml_base.Credential
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

module Session = struct
  open Lexicon
  type t = server_createSession_output =
    { accessJwt: string ;
      refreshJwt: string ;
      handle: handle ;
      did: did ;
      email: string option
    }
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
module type QueryIntf = sig
  val nsid : Nsid.t
  type parameters [@@deriving yojson]
  type output [@@deriving yojson]
end

let add_query_params uri = function
  | `Assoc kvs ->
      let kvs = List.map (function
          | (k, `String v) -> (k, v)
          | (k, `Int i) -> (k, Int.to_string i)
          | (k, `Intlit i) -> (k, i)
          | (k, _) -> invalid_arg ("add_query_params: key " ^ k ^ " has non string")) kvs
      in
      Uri.add_query_params' uri kvs
  | _ -> invalid_arg "add_query_params"

(* query by GET *)
let query (type parameters) (type output)
    (module Intf : QueryIntf with type parameters = parameters
                              and type output = output)
    conn ?session params =
  let uri = Conn.make_uri conn Intf.nsid in
  let params = Intf.yojson_of_parameters params in
  let uri = add_query_params uri params in
  let headers = make_http_headers session in
  let* resp, body = Conn.get conn ~headers uri in
  ok_or_fail resp body Intf.output_of_yojson

module Query(Intf : QueryIntf) = struct
  include Intf
  let f conn = query (module Intf) conn
end

module type ProcedureIntf = sig
  val nsid : Nsid.t
  type input [@@deriving yojson]
  type output [@@deriving yojson]
end

(* procedure by POST *)
let procedure (type input) (type output)
    (module Intf : ProcedureIntf with type input = input
                                  and type output = output
    ) conn ?session input =
  let uri = Conn.make_uri conn Intf.nsid in
  let headers = make_http_headers session in
  let input = Intf.yojson_of_input input in
  let body : Cohttp_lwt.Body.t = `String (Yojson.Safe.to_string input) in
  Format.eprintf "body: %s@." (Yojson.Safe.to_string input);
  let* resp, body = Conn.post conn ~headers ~body uri in
  ok_or_fail resp body Intf.output_of_yojson

module Procedure(Intf : ProcedureIntf) = struct
  include Intf
  let f conn = procedure (module Intf) conn
end
