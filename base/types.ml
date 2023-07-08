module Cid = struct
  (* Ex "bafyreidfoylpefa2a7muoppun44srdvqdm45dasagnlk3wjjlh6ykf3mde" *)

  type t = string [@@deriving yojson]

  let is_valid _ = true

  let to_string s = s
  let of_string s = if is_valid s then Some s else None
  let unsafe_of_string s = s
end

module Nsid = struct
  type t = string [@@deriving yojson]

  (* TODO: https://atproto.com/specs/nsid *)
  let is_valid _ = true

  let to_string s = s
  let of_string s = if is_valid s then Some s else None
  let unsafe_of_string s = s
end

module Handle = struct
  type t = string [@@deriving yojson]

  (* TODO: https://atproto.com/specs/handle *)
  let is_valid _ = true

  let to_string s = s
  let of_string s = if is_valid s then Some s else None
  let unsafe_of_string s = s
end

module Did = struct
  type t = string [@@deriving yojson]

  (* TODO: https://atproto.com/specs/did *)
  let parse s =
    match String.split_on_char ':' s with
    | "did" :: "plc" :: s :: [] -> Some (`Plc s)
    | "did" :: "web" :: s :: [] -> Some (`Web s)
    | "did" :: meth :: ss -> Some (`Other (meth, ss))
    | _ -> None

  let to_string s = s

  let of_string s =
    match parse s with
    | Some _ -> Some s
    | None -> None

  let unsafe_of_string s = s
end

module Aturi = struct
  type t = string [@@deriving yojson]

  let to_string s = s
  let of_string s = Some s (* TODO *)
  let unsafe_of_string t = t
(*
  let authority t = Option.get @@ Uri.host t
  let path = Uri.path ?pct_encoder:None
  let query = Uri.query
  let fragment = Uri.fragment

  (* TODO *)
  let is_valid t =
    Uri.scheme t  = Some "at"
    && Uri.userinfo t = None
    &&
    match Uri.host t with
    | None -> false
    | Some auth ->
        match Did.parse auth with
        | None -> true
        | Some (`Plc _ | `Web _) -> true
        | Some (`Other _) -> false

  let to_string t = Uri.to_string t

  let of_string s =
    try
      let t = Uri.of_string s in
      if is_valid t then Some t else None
    with
    | _ -> None
*)
end

module Datetime = struct
  type t = string [@@deriving yojson]

  let to_string s = s
  let of_string s = Some s (* TODO *)
  let unsafe_of_string t = t
end

module Session = struct
  type t =
    { did : Did.t;
      handle : Handle.t;
      email : string;
      accessJwt : string;
      refreshJwt : string
    } [@@deriving yojson]
end

module Unknown = struct
  type t = Yojson.Safe.t
  let yojson_of_t = Fun.id
  let t_of_yojson = Fun.id
end

(* https://atproto.com/lexicons/com-atproto-label#comatprotolabeldefs *)
module Label = struct
  type t = {
    type_ : string option [@key "$type"] [@yojson.option];
    src : Did.t;
    uri : Aturi.t;
    val_ : string [@key "val"];
    neg : bool option [@yojson.option];
    cts : Datetime.t;
  } [@@deriving yojson]
end

(* https://atproto.com/lexicons/app-bsky-actor#appbskyactordefs *)
module Actor = struct
  type viewerState = {
    type_ : string option [@key "$type"] [@yojson.option];
    muted : bool option [@yojson.option];
    blockedBy : bool option [@yojson.option];
    blocking : Aturi.t option [@yojson.option];
    following : Aturi.t option  [@yojson.option];
    followedBy : Aturi.t option  [@yojson.option];
  } [@@deriving yojson]

  type profileViewBasic = {
    type_ : string option [@key "$type"] [@yojson.option];
    did : Did.t;
    handle : Handle.t;
    displayName : string option [@yojson.option];
    avatar : string option [@yojson.option];
    viewer : viewerState option [@yojson.option];
    labels : Label.t list option [@yojson.option];
  } [@@deriving yojson]
end

module Repo = struct
  (* https://atproto.com/lexicons/com-atproto-repo#comatprotorepostrongref *)
  type strongRef =
    { uri : Aturi.t;
      cid : Cid.t;
    } [@@deriving yojson]
end

(* https://atproto.com/lexicons/app-bsky-feed#appbskyfeeddefs *)
module Feed = struct

  type viewerState = {
    type_ : string option [@key "$type"] [@yojson.option];
    repost : Aturi.t option [@yojson.option];
    like : Aturi.t option [@yojson.option];
  } [@@deriving yojson]

  type postViewEmbed = Unknown.t [@@deriving yojson] (* TODO *)

  type postView = {
    type_ : string option [@key "$type"] [@yojson.option];
    uri : Aturi.t;
    cid : Cid.t;
    author : Actor.profileViewBasic; (* app.bsky.actor.defs#profileViewBasic *)
    record : Unknown.t;
    embed : postViewEmbed option [@yojson.option];
    replyCount : int64 option [@yojson.option];
    repostCount : int64 option [@yojson.option];
    likeCount : int64 option [@yojson.option];
    indexedAt : Datetime.t;
    viewer : viewerState option [@yojson option];
    labels : Label.t list option [@yojson option];
  } [@@deriving yojson]

  type replyRef = {
    type_ : string option [@key "$type"] [@yojson.option];
    root : postView;
    parent : postView;
  } [@@deriving yojson]

  type reasonRepost = {
    type_ : string option [@key "$type"] [@yojson.option];
    by : Actor.profileViewBasic;
    indexedAt : Datetime.t;
  } [@@deriving yojson]

  type feedViewPost = {
    type_ : string option [@key "$type"] [@yojson.option];
    post : postView;
    reply : replyRef option [@yojson.option];
    reason : reasonRepost option [@yojson.option]
  } [@@deriving yojson]
end
