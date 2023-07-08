(* Post by CreateRecord *)

include Xrpc.Atproto.Repo.CreateRecord

type record =
  { text : string;
    createdAt : string (* RFC3339 *)
  } [@@deriving yojson]

let f ~session conn ?createdAt text =
  let createdAt = Option.value createdAt ~default:(Ptime_clock.now ()) in
  let createdAt = Ptime.to_rfc3339 ~tz_offset_s:0 createdAt in
  let record = { text; createdAt } in
  let record = yojson_of_record record in
  let collection = "app.bsky.feed.post" in
  Xrpc.Atproto.Repo.CreateRecord.f ~session conn
    { repo= session.did;
      collection;
      rkey= None;
      validate= None;
      record;
      swapCommit= None }
