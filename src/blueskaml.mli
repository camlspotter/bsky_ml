type error =
  [ `Decode_failure of exn
  | `HTTP_failure of Cohttp.Response.t * string
  | `Exn of exn
  ]

type 'a monad = ('a, error) result Lwt.t

module type Client = Cohttp_lwt.S.Client

(** Ex (module Cohttp_lwt_unix.Client) *)
type client = (module Client)

module Credential : sig
  type t = { identifier : string; password : string; } [@@deriving yojson]
  val load : string -> (t, error) result
end

module ResolveHandle : sig

  val base_url : string
  val entrypoint : string
  val uri : Uri.t

  type resp = { did : string; } [@@deriving yojson]

  val pp : Format.formatter -> resp -> unit

  val f : client -> string -> resp monad
end

module CreateSession : sig

  val base_url : string
  val entrypoint : string
  val uri : Uri.t

  type resp = {
    did : string;
    handle : string;
    email : string;
    accessJwt : string;
    refreshJwt : string;
  } [@@deriving yojson]

  val pp : Format.formatter -> resp -> unit

  val f :
    client ->
    identifier:string ->
    password:string ->
    resp monad
end

type session = CreateSession.resp

module GetAuthorFeed : sig

  val base_url : string
  val entrypoint : string
  val uri : Uri.t

  type resp = Yojson.Safe.t [@@deriving yojson]

  val pp : Format.formatter -> resp -> unit

  val f :
    client ->
    actor:string ->
    ?limit:int ->
    ?cursor:string ->
    session ->
    resp monad
end

module GetTimeline : sig

  val base_url : string
  val entrypoint : string
  val uri : Uri.t

  type postView = Yojson.Safe.t  [@@deriving yojson]

  type reply = Yojson.Safe.t [@@deriving yojson]

  type reason = Yojson.Safe.t [@@deriving yojson]

  type feed_item = {
    post : postView;
    reply : reply option;
    reason : reason option;
  } [@@deriving yojson]

  type resp = {
    feed : feed_item list;
    cursor : string option [@yojson.option]
  } [@@deriving yojson]

  val pp : Format.formatter -> resp -> unit

  val f :
    client ->
    ?algorithm:string ->
    ?limit:int ->
    ?cursor:string ->
    session ->
    resp monad
end

module CreateRecord : sig

  val base_url : string
  val entrypoint : string
  val uri : Uri.t

  type resp =
    { uri : string;
      cid : string
    } [@@deriving yojson]

  val pp : Format.formatter -> resp -> unit

  val f :
    client ->
    collection:string ->
    record: Yojson.Safe.t ->
    session ->
    resp monad
end

module Post : sig

  val f :
    client ->
    text:string ->
    ?createdAt:Ptime.t ->
    session ->
    CreateRecord.resp monad
end

module Like : sig

  val f :
    client ->
    subject:CreateRecord.resp ->
    ?createdAt:Ptime.t ->
    session ->
    CreateRecord.resp monad
end

module Search : sig

  val base_url : string
  val entrypoint : string
  val uri : Uri.t

  type user =
    { did : string; handle : string; } [@@deriving yojson]

  type post =
    { createdAt : int64; text : string; user : string; } [@@deriving yojson]

  type post_found =
    { tid : string; cid : string; user : user; post : post; }
  [@@deriving yojson]

  type resp = post_found list [@@deriving yojson]

  val pp : Format.formatter -> resp -> unit

  val posts :
    client ->
    string ->
    resp monad
end
