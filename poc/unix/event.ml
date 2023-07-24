open Lwt.Syntax
open Blueskaml_car
open Blueskaml_poc

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


module SubscribeRepos = struct
  open Blueskaml_base.Types

  let nsid = Nsid.unsafe_of_string "com.atproto.sync.subscribeRepos"

  let f conn h init =
    let uri = Printf.sprintf "wss://%s/xrpc/%s" conn.Xrpc.Conn.host (Nsid.to_string nsid) in
    let* conn = connect (Uri.of_string uri) in
    let rec loop acc =
      let* cbors = read conn in
      match h acc cbors with
      | `Continue acc -> loop acc
      | `Exit acc -> Lwt.return acc
    in
    loop init
end
