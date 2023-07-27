open Bsky_ml_base
open Bsky_ml_car
open Bsky_ml_poc

type conn = Websocket_lwt_unix.conn

val connect : Uri.t -> conn Lwt.t

val read : conn -> Cbor.t Seq.t Lwt.t

module SubscribeRepos : sig
  val nsid : Types.Nsid.t

  val f :
    Xrpc.Conn.t ->
    ('acc -> Cbor.t Seq.t -> [< `Continue of 'acc | `Exit of 'res ]) ->
    'acc -> 'res Lwt.t
end
