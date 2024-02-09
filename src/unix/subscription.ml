open Lwt.Syntax
open Bsky_ml_car
open Bsky_ml

module W = Websocket_lwt_unix

type conn = Websocket_lwt_unix.conn

let connect uri =
  let host =
    match Uri.host uri with
    | None -> invalid_arg "Event.connect"
    | Some host -> host
  in
  let hent = Unix.gethostbyname host in
  let iaddrs = hent.h_addr_list in
  let ipaddrs =
    Array.map (fun iaddr ->
        Ipaddr.of_string_exn @@ Unix.string_of_inet_addr iaddr)
      iaddrs
  in
  (* XXX not sure this is correct or not... but it is working *)
  let client : Conduit_lwt_unix.client =
    `OpenSSL (`Hostname host,
              `IP ipaddrs.(0),
              `Port 443)
  in
  W.connect client uri

let decode s =
  Seq.unfold (fun s ->
      if s = "" then None
      else
        let t, s = Cbor.decode_partial s in
        Some (t, s)) s

let read conn =
  let buf = Buffer.create 1024 in
  let rec loop () =
    let* f : Websocket.Frame.t = W.read conn in
    Buffer.add_string buf f.content;
    if f.final then Lwt.return @@ decode @@ Buffer.contents buf
    else loop ()
  in
  loop ()

open Bsky_ml_base.Types

module type SubscriptionIntf = sig
  val nsid : Nsid.t
  type parameters [@@deriving yojson]
  type message [@@deriving yojson]
end

type header =
  { t : string;
    op : int } [@@deriving yojson]

let decode_header cbor =
  match Dag_cbor.to_json cbor with
  | exception exn ->
      Error (`Dag_cbor_decode_failure (exn, cbor))
  | json ->
      match header_of_yojson json with
      | h -> Ok h
      | exception exn ->
          Error (`Header_decode_failure (exn, json))

let decode_cbor cbor tag conv =
  match Dag_cbor.to_json cbor with
  | exception exn ->
      Error (`Dag_cbor_decode_failure (exn, cbor))
  | `Assoc kvs ->
      let kvs = ("$type", `String tag) :: kvs in
      let json = `Assoc kvs in
      (match conv json with
      | a -> Ok a
      | exception Ppx_yojson_conv_lib.Yojson_conv.Of_yojson_error (exn, j') ->
          Format.eprintf "@[<2>Decode failure: %s@ @[%a@]@]@."
            (Printexc.to_string exn)
            (Yojson.Safe.pretty_print ~std:false) j';
          Error (`Decode_failure json))
  | json -> Error (`Subscription_not_kvs json)

let subscription (type parameters) (type message)
    (module Intf : SubscriptionIntf with type parameters = parameters
                                     and type message = message)
    conn (_parameters : parameters) h init =
  (* How to send parameters?
     In header?
  *)
  let uri =
    Printf.sprintf "wss://%s/xrpc/%s"
      conn.Xrpc.Conn.host (Nsid.to_string Intf.nsid)
  in
  Format.eprintf "Connecting to %s@." uri;
  let* conn = connect (Uri.of_string uri) in
  let rec loop acc =
    let* cbors = read conn in
    let rec loop2 acc cbors =
      match cbors () with
      | Seq.Nil -> loop acc
      | Cons (cbor, cbors) ->
          match decode_header cbor with
          | Error _ -> Lwt.return acc
          | Ok header ->
              let tag = header.t in
              assert (tag <> "");
              assert (tag.[0] = '#');
              let tag = Nsid.to_string Intf.nsid ^ tag in
              match cbors () with
              | Seq.Nil -> assert false
              | Cons (cbor, cbors) ->
                  match decode_cbor cbor tag Intf.message_of_yojson with
                  | Error _ -> Lwt.return acc
                  | Ok a ->
                      match h acc a with
                      | `Continue acc -> loop2 acc cbors
                      | `Exit acc -> Lwt.return acc
    in
    loop2 acc cbors
  in
  loop init

module Subscription(Intf : SubscriptionIntf) = struct
  include Intf
  let f conn = subscription (module Intf) conn
end

module SubscribeRepos =
  Subscription(struct
    let nsid = Nsid.unsafe_of_string "com.atproto.sync.subscribeRepos"
    type parameters = Lexicon.sync_subscribeRepos_parameters
    [@@deriving yojson]
    type message = Lexicon.sync_subscribeRepos_message
    [@@deriving yojson]
  end)
