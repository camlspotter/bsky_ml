module Cid = struct
  type t =
    | V0 of string
    | V1 of { codec : int; hash_function_code : int; digest : string }

  let pp ppf = function
    | V0 s ->
        Format.fprintf ppf "V0 %s" (let `Hex h = Hex.of_string s in h)
    | V1 {codec; hash_function_code; digest} ->
        Format.fprintf ppf "V1 %x %x %s"
          codec
          hash_function_code
          (let `Hex h = Hex.of_string digest in h)

  let decode =
    let open ParserM in
    let open ParserM.Syntax in
    ( let* ss = get_string 2 in
      match Char.code ss.[0], Char.code ss.[1] with
      | 0x12, 0x20 (* CIDv0 *) ->
          let+ sha2_256 = get_string 32 in
          V0 sha2_256
      | _ -> ParserM.fail "not CIDv0" )
    <|>
    let* v = Leb128.Unsigned.decode in
    if v <> 1 then fail "cidv1: wrong version"
    else
      let* codec = Leb128.Unsigned.decode in
      let* hash_function_code = Leb128.Unsigned.decode in
      let* digest_size = Leb128.Unsigned.decode in
      let+ digest = get_string digest_size in
      V1 {codec; hash_function_code; digest}

  let v0head = Printf.sprintf "%c%c" (Char.chr 0x12) (Char.chr 0x20)

  let encode = function
    | V0 s -> v0head ^ s
    | V1 { codec; hash_function_code; digest } ->
        let buf = Buffer.create 64 in
        Buffer.add_string buf @@ Leb128.Unsigned.encode 1;
        Buffer.add_string buf @@ Leb128.Unsigned.encode codec;
        Buffer.add_string buf @@ Leb128.Unsigned.encode hash_function_code;
        Buffer.add_string buf @@ Leb128.Unsigned.encode (String.length digest);
        Buffer.add_string buf digest;
        Buffer.contents buf
end

let header =
  let open ParserM in
  let open ParserM.Syntax in
  let* len = Leb128.Unsigned.decode in
  let* cbor = get_string len in
  return (Cbor.decode cbor)

type block = [ `Dag_cbor of Cid.t * Cbor.t | `Raw of Cid.t * string ]

let parse_block cid data =
  match cid with
  | Cid.V1 { codec= 0x71; hash_function_code=_; digest=_ } ->
      `Dag_cbor (cid, Cbor.decode data)
  | _ -> `Raw (cid, data)

let block =
  let open ParserM in
  let open ParserM.Syntax in
  let* len = Leb128.Unsigned.decode in
  let* pos = current_pos in
  let* cid = Cid.decode in
  let* pos' = current_pos in
  let+ data = get_string (len - (pos' - pos)) in
  parse_block cid data

let decode =
  let open ParserM in
  let open ParserM.Syntax in
  let* h = header in
  let+ bs =
    list (
      let* done_ = eos in
      if done_ then return None
      else
        let+ b = block in
        Some b
    )
  in
  h, bs
