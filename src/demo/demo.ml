open Lwt.Syntax
open Blueskaml
open Blueskaml_base.Utils
module Credential = Blueskaml_base.Credential

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
  let* resp = Xrpc.Atproto.Identity.ResolveHandle.f conn { handle = cred.identifier } in
  Format.eprintf "Ok: %a@."
    (pp_as_json Xrpc.Atproto.Identity.ResolveHandle.yojson_of_output)
    (Result.get_ok resp);

  let* resp =
    Xrpc.Atproto.Server.CreateSession.f conn
      { identifier= cred.identifier;
        password= cred.password }
  in
  let session = Result.get_ok resp in
  Format.eprintf "Ok: %a@."
    (pp_as_json Xrpc.Atproto.Server.CreateSession.yojson_of_output) session;

  let* resp =
    Xrpc.Bsky.Feed.GetAuthorFeed.f ~session conn
      { actor= session.handle;
        limit= Some 1L;
        cursor = None }
  in
  Format.eprintf "Ok %a@."
    (pp_as_json Xrpc.Bsky.Feed.GetAuthorFeed.yojson_of_output) (Result.get_ok resp);

  let* resp = Xrpc.Bsky.Feed.GetTimeline.f ~session conn
      { algorithm= None;
        limit= Some 1L;
        cursor= None }
  in
  Format.eprintf "Ok %a@."
    (pp_as_json Xrpc.Bsky.Feed.GetTimeline.yojson_of_output) (Result.get_ok resp);

  let* resp = Search.posts client "破壊" in
  Format.eprintf "Ok %a@."
    (pp_as_json Search.yojson_of_output) (Result.get_ok resp);

  let* resp = Post.f ~session conn "Hello from Blueskaml" in
  Format.eprintf "Ok %a@."
    (pp_as_json Post.yojson_of_output) (Result.get_ok resp);

  let subject = Result.get_ok resp in
  let* resp = Like.f ~session conn subject in
  Format.eprintf "Ok %a@."
    (pp_as_json Like.yojson_of_output) (Result.get_ok resp);

  Lwt.return_unit
