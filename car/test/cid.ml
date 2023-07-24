open Blueskaml_car

let () =
  let base32 = "bafyreidfoylpefa2a7muoppun44srdvqdm45dasagnlk3wjjlh6ykf3mde" in
  let enc, bin = Result.get_ok @@ Multibase.decode base32 in
  assert (enc = `Base32);
  let cid, (_, pos) = Result.get_ok @@ Car.Cid.decode (bin, 0) in
  assert (String.length bin = pos);
  Format.eprintf "%a@." Car.Cid.pp cid
