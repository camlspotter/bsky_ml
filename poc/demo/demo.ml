open Lwt.Syntax
open Blueskaml_base
open Blueskaml_poc
open Utils
open Types

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
  let client = (module Cohttp_lwt_unix.Client : Cohttp_lwt.S.Client) in
  let conn = Xrpc.Conn.create client "bsky.social" in
  let* resp = Xrpc.ResolveHandle.f conn cred.identifier in
  Format.eprintf "%a@."
    (pp_as_json Xrpc.ResolveHandle.yojson_of_resp)
    (Result.get_ok resp);

  let* resp =
    Xrpc.CreateSession.f conn
      ~identifier:cred.identifier
      ~password:cred.password
  in
  let session = Result.get_ok resp in
  Format.eprintf "%a@."
    (pp_as_json Session.yojson_of_t) session;

  let* resp =
    Xrpc.GetAuthorFeed.f
      ~actor: (Handle.to_string session.handle)
      ~limit: 1
      conn session
  in
  Format.eprintf "%a@."
    (pp_as_json Xrpc.GetAuthorFeed.yojson_of_resp) (Result.get_ok resp);

  let* resp = Xrpc.GetTimeline.f ~limit: 1 conn session in
  Format.eprintf "%a@."
    (pp_as_json Xrpc.GetTimeline.yojson_of_resp) (Result.get_ok resp);

  let* resp = Xrpc.Search.posts client "破壊" in
  Format.eprintf "%a@."
    (pp_as_json Xrpc.Search.yojson_of_resp) (Result.get_ok resp);

  let* resp = Xrpc.Post.f conn ~text:"Hello from Blueskaml" session in
  Format.eprintf "%a@."
    (pp_as_json Xrpc.CreateRecord.yojson_of_resp) (Result.get_ok resp);

  let resp = Result.get_ok resp in
  let subject = Repo.{ uri = resp.uri; cid = resp.cid } in
  let* resp = Xrpc.Like.f conn ~subject session in
  Format.eprintf "%a@."
    (pp_as_json Xrpc.CreateRecord.yojson_of_resp) (Result.get_ok resp);

  Lwt.return_unit
