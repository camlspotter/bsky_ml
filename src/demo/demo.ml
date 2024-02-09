open Lwt.Syntax
open Bsky_ml
open Bsky_ml_base.Utils
module Credential = Bsky_ml_base.Credential

(* Your identifier and password saved at $HOME/.bluesky-cred *)
let cred =
  let home =
    try Sys.getenv "HOME" with
    | _ -> failwith "No HOME"
  in
  let fn = Filename.concat home ".bluesky-cred" in
  match Credential.load fn with
  | Ok cred -> cred
  | Error _ ->
      Format.eprintf "Make a JSON file at $HOME/.bluesky-cred of your handle and password like:@.";
      Format.eprintf "@[%a@]@."
        (Yojson.Safe.pretty_print ~std:false)
        Credential.(yojson_of_t
                      { identifier= "foobar.bsky.social";
                        password= "xxxx-yyyy-zzzz-wwww" });
      Format.eprintf "Yes it is insecure.@.";
      exit 1

let () =
  Lwt_main.run @@

  (* Estabilish a connection *)
  let client = (module Cohttp_lwt_unix.Client : Cohttp_lwt.S.Client) in
  let conn = Xrpc.Conn.create client "bsky.social" in

  (* Who am I ? *)
  let* resp = Xrpc.Atproto.Identity.ResolveHandle.f conn { handle = cred.identifier } in
  Format.eprintf "Ok: %a@."
    (pp_as_json Xrpc.Atproto.Identity.ResolveHandle.yojson_of_output)
    (Result.get_ok resp);

  (* Create a session *)
  let* resp =
    Xrpc.Atproto.Server.CreateSession.f conn
      { identifier= cred.identifier;
        password= cred.password }
  in
  let session = Result.get_ok resp in
  Format.eprintf "Ok: %a@."
    (pp_as_json Xrpc.Atproto.Server.CreateSession.yojson_of_output) session;

  (* Author's last post *)
  let* resp =
    Xrpc.Bsky.Feed.GetAuthorFeed.f ~session conn
      { actor= session.handle;
        limit= Some 1L;
        cursor = None;
        filter = None}
  in
  Format.eprintf "Ok %a@."
    (pp_as_json Xrpc.Bsky.Feed.GetAuthorFeed.yojson_of_output) (Result.get_ok resp);

  (* Author's timeline *)
  let* resp = Xrpc.Bsky.Feed.GetTimeline.f ~session conn
      { algorithm= None;
        limit= Some 1L;
        cursor= None }
  in
  Format.eprintf "Ok %a@."
    (pp_as_json Xrpc.Bsky.Feed.GetTimeline.yojson_of_output) (Result.get_ok resp);

  (* Search by UTF-8 string *)
  let* resp = Search.posts client "🐪" in
  Format.eprintf "Ok %a@."
    (pp_as_json Search.yojson_of_output) (Result.get_ok resp);

  (* Post *)
  let* resp = Post.f ~session conn "Hello from Bsky_ml, https://github.com/camlspotter/bsky_ml" in
  Format.eprintf "Ok %a@."
    (pp_as_json Post.yojson_of_output) (Result.get_ok resp);

  (* Like the post *)
  let record = Result.get_ok resp in
  let* resp = Like.f ~session conn record in
  Format.eprintf "Ok %a@."
    (pp_as_json Like.yojson_of_output) (Result.get_ok resp);

  Lwt.return_unit
