open Blueskaml
open Blueskaml_unix

let () =
  Lwt_main.run @@
  let conn =
    Xrpc.Conn.create (module Cohttp_lwt_unix.Client) "bsky.social"
  in
  Event.SubscribeRepos.f conn
    (fun () cbors ->
       Seq.iter (fun cbor ->
           Format.eprintf "@[%a@]@." Cbor.pp cbor) cbors;
       `Continue ()) ()
