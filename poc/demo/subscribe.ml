open Bsky_ml_car
open Bsky_ml_poc
open Bsky_ml_poc_unix

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
