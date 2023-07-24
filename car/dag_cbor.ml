let json_of_cid cid_bin =
  let f cid_bin off =
    let cid, _ = Result.get_ok @@ Car.Cid.decode (cid_bin, off) in
    match cid with
    | Car.Cid.V0 s ->
        `String (Result.get_ok @@ Multibase.encode `Base32 s)
    | Car.Cid.V1 _ ->
        `String (Result.get_ok @@ Multibase.encode `Base32 (Car.Cid.encode cid))

  in
  try
    if cid_bin.[0] = '\000' then
      (* link *)
      let cid = f cid_bin 1 in
      (* `Variant ("Link", Some cid) *) (* XXX *)
      cid
    else
      f cid_bin 0
  with
  | _ ->
      let `Hex h = Hex.of_string cid_bin in
      `Variant ("StrangeCID", Some ( `String h))

let rec to_json = function
  | `Array ts -> `List (List.map to_json ts)
  | `Bool b -> `Bool b
  | `Bytes s -> `String s
  | `Float f -> `Float f
  | `Int i -> `Int i
  | `Null -> `Null
  | `Simple i -> `Int i (*?*)
  | `Tag (42, `Bytes s) -> json_of_cid s (* CID *)
  | `Tag (_tag, _t) -> invalid_arg "Cbor.to_json: Tag"
  | `Text s -> `String s
  | `Undefined -> invalid_arg "Cbor.to_json: Undefined"
  | `Map kvs ->
      `Assoc (List.map (function
(*
          | (`Text "blocks", `Bytes bs) -> "blocks", json_of_car bs
*)
          | (`Text s,v) -> s, to_json v
          | _ -> invalid_arg "Cbor.to_json: Map") kvs)

let json_of_car block_bin =
  let (head, blocks), _ = Result.get_ok @@ Car.decode (block_bin, 0) in
  let json_of_block = function
    | `Dag_cbor (cid, cbor) -> `Tuple [json_of_cid (Car.Cid.encode cid); to_json cbor]
    | `Raw (cid, string) -> `Tuple [json_of_cid (Car.Cid.encode cid); `String string]
  in
  `Tuple [to_json head; `List (List.map json_of_block blocks)]
