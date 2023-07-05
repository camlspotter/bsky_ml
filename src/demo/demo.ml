open Lwt.Syntax
open Blueskaml

let client : client = (module Cohttp_lwt_unix.Client)

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
  let* resp = ResolveHandle.f client cred.identifier in
  Format.eprintf "%a@." ResolveHandle.pp (Result.get_ok resp);

  let* resp =
    CreateSession.f client
      ~identifier:cred.identifier
      ~password:cred.password
  in
  let session = Result.get_ok resp in
  Format.eprintf "%a@." CreateSession.pp session;

  let* resp = GetTimeline.f ~limit: 1 client session in
  Format.eprintf "%a@." GetTimeline.pp (Result.get_ok resp);

  let* resp = Post.f client ~text:"Hello from blueskaml.ml" session in
  Format.eprintf "%a@." CreateRecord.pp (Result.get_ok resp);

  let* resp = Search.posts client "破壊" in
  Format.eprintf "%a@." Search.pp (Result.get_ok resp);

  let* resp =
    GetAuthorFeed.f client ~actor:session.handle ~limit:3 session in
  let resp = Result.get_ok resp in
  Format.eprintf "%a@." GetAuthorFeed.pp resp;

  Lwt.return_unit
