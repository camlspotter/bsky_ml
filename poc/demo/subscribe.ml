open Blueskaml_car
open Blueskaml_poc
open Blueskaml_poc_unix

let () =
  Lwt_main.run @@
  let conn =
    Xrpc.Conn.create (module Cohttp_lwt_unix.Client) "bsky.social"
  in
  Event.SubscribeRepos.f conn
    (fun () cbors ->
       Seq.iter (fun cbor ->
           let json = Dag_cbor.to_json cbor in
           Format.eprintf "@[%a@]@." (Yojson.Safe.pretty_print ~std:false) json) cbors;
       `Continue ()) ()
