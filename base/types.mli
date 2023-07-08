module Cid : sig
  (** Content IDentifier in multibased text

      Ex. [bafyreidfoylpefa2a7muoppun44srdvqdm45dasagnlk3wjjlh6ykf3mde]

      See https://github.com/multiformats/cid
  *)
  type t = private string [@@deriving yojson]

  val to_string : t -> string

  val of_string : string -> t option

  val unsafe_of_string : string -> t
end

module Nsid : sig
  (** Namespace Identifier

      Ex. [com.example.fooBar]

      See https://atproto.com/specs/nsid
  *)
  type t = private string [@@deriving yojson]

  val to_string : t -> string

  (* TODO: currently no validity check *)
  val of_string : string -> t option

  val unsafe_of_string : string -> t
end

module Handle : sig
  (** Handle

     Ex. [foobar.bsky.social]

     See https://atproto.com/specs/handle
  *)
  type t = private string [@@deriving yojson]

  val to_string : t -> string

  (* TODO: currently no validity check *)
  val of_string : string -> t option

  val unsafe_of_string : string -> t
end

module Did : sig
  (** DID in text

      Ex. [did:plc:rivbee5mfjetayu6fvmhqe3m]

      See https://atproto.com/specs/did
  *)
  type t = private string [@@deriving yojson]

  val parse :
    string ->
    [> `Plc of string
    | `Web of string
    | `Other of string * string list ] option

  val to_string : t -> string
  val of_string : string -> t option
  val unsafe_of_string : string -> t
end

module Aturi : sig
  (** AT URI Scheme in text

      Ex. [at://did:plc:rivbee6mfjetayu6fvmhqe3m/app.bsky.feed.post/3jzscicwdqb2n]

      See https://atproto.com/specs/at-uri-scheme
  *)
  type t = private string [@@deriving yojson]

  (* Unfortunately, we cannot use https://github.com/mirage/ocaml-uri,
     since it cannot handle multiple ':' chars in host name part.
  *)

(*
  val authority : t -> string
  val path : t -> string
  val query : t -> (string * string list) list
  val fragment : t -> string option

  val is_valid : Uri.t -> bool
*)
  val to_string : t -> string
  val of_string : string -> t option
  val unsafe_of_string : string -> t
end

module Datetime : sig
  type t = private string

  val to_string : t -> string
  val of_string : string -> t option
  val unsafe_of_string : string -> t
end

module Session : sig
  (** Response of CreateSession *)
  type t =
    { did : Did.t;
      handle : Handle.t;
      email : string;
      accessJwt : string;
      refreshJwt : string
    } [@@deriving yojson]
end

module Unknown : sig
  type t = Yojson.Safe.t [@@deriving yojson]
end

(** https://atproto.com/lexicons/com-atproto-label#comatprotolabeldefs *)
module Label : sig
  type t = {
    type_ : string option [@name "$type"] [@yojson.option];
    src : Did.t;
    uri : Aturi.t;
    val_ : string [@name "val"];
    neg : bool option [@yojson.option];
    cts : string (* datetime *);
  } [@@deriving yojson]
end

(** https://atproto.com/lexicons/app-bsky-actor#appbskyactordefs *)
module Actor : sig
  type viewerState = {
    type_ : string option [@name "$type"] [@yojson.option];
    muted : bool option [@yojson.option];
    blockedBy : bool option [@yojson.option];
    blocking : Aturi.t option [@yojson.option];
    following : Aturi.t option  [@yojson.option];
    followedBy : Aturi.t option  [@yojson.option];
  } [@@deriving yojson]

  type profileViewBasic = {
    type_ : string option [@name "$type"] [@yojson.option];
    did : Did.t;
    handle : Handle.t;
    displayName : string option [@yojson.option];
    avatar : string option [@yojson.option];
    viewer : viewerState option [@yojson.option];
    labels : Label.t list option [@yojson.option];
  } [@@deriving yojson]
end

module Repo : sig
  (** https://atproto.com/lexicons/com-atproto-repo#comatprotorepostrongref *)
  type strongRef =
    { uri : Aturi.t;
      cid : Cid.t;
    } [@@deriving yojson]
end

(** https://atproto.com/lexicons/app-bsky-feed#appbskyfeeddefs *)
module Feed : sig

  type postViewEmbed = Yojson.Safe.t [@@deriving yojson]

  type viewerState = {
    type_ : string option [@name "$type"] [@yojson.option];
    repost : Aturi.t option [@yojson.option];
    like : Aturi.t option [@yojson.option];
  } [@@deriving yojson]

  type postView = {
    type_ : string option [@name "$type"] [@yojson.option];
    uri : Aturi.t;
    cid : Cid.t;
    author : Actor.profileViewBasic; (* app.bsky.actor.defs#profileViewBasic *)
    record : Unknown.t;
    embed : postViewEmbed option [@yojson.option];
    replyCount : int64 option [@yojson.option];
    repostCount : int64 option [@yojson.option];
    likeCount : int64 option [@yojson.option];
    indexedAt : string (* datetime *);
    viewer : viewerState option [@yojson option];
    labels : Label.t list option [@yojson option];
  } [@@deriving yojson]

  type replyRef = {
    type_ : string option [@name "$type"] [@yojson.option];
    root : postView;
    parent : postView;
  } [@@deriving yojson]

  type reasonRepost = {
    type_ : string option [@name "$type"] [@yojson.option];
    by : Actor.profileViewBasic;
    indexedAt : string (* datetime *);
  } [@@deriving yojson]

  type feedViewPost = {
    type_ : string option [@name "$type"] [@yojson.option];
    post : postView;
    reply : replyRef option [@yojson.option];
    reason : reasonRepost option [@yojson.option]
  } [@@deriving yojson]

end
