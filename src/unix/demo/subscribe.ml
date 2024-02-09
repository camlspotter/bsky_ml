open Bsky_ml
open Utils
open Bsky_ml_car
open Bsky_ml_unix

let () =
  Lwt_main.run @@
  let conn =
    Xrpc.Conn.create (module Cohttp_lwt_unix.Client) "bsky.social"
  in
  prerr_endline "connected";
  Subscription.SubscribeRepos.f conn
    {cursor= None}
    (fun () message ->
       let (message : Lexicon.sync_subscribeRepos_message), blocks_list =
         match message with
         | Commit commit ->
             let blocks =
               Dag_cbor.json_of_car (Bytes.unsafe_to_string commit.blocks)
             in
             Commit { commit with blocks = Bytes.of_string "..." },
             [blocks]
         | _ -> message, []
       in
       Format.eprintf "%a@."
         (pp_as_json Subscription.SubscribeRepos.yojson_of_message)
         message;
       List.iter (fun blocks ->
           Format.eprintf "  %a@."
             (Yojson.Safe.pretty_print ~std:true) blocks) blocks_list;
       `Continue ()) ()
