open Blueskaml
open Leb128.Unsigned

let () =
  let uleb128 = encode 624485 in
  let `Hex h = Hex.of_string uleb128 in
  assert (h = "e58e26");
  assert (
    match decode (uleb128, 0) with
    | Ok (624485, (_, 3)) -> true
    | _ -> false
  )
