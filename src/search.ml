(* This is NOT an XRPC *)

open Bsky_ml_base.Utils
open Bsky_ml_base.Types
open Xrpc_base
open Lwt.Syntax

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

type output = post_found list [@@deriving yojson]

let posts (module Client : Conn.Client) q =
  let uri =
    Uri.add_query_params' uri
      [ "q", q ]
  in
  let* resp, body = Client.get uri in
  ok_or_fail resp body output_of_yojson
