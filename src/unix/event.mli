open Blueskaml

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
