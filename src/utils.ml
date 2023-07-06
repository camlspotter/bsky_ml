let pp_as_json yojson_of ppf x =
  Yojson.Safe.pretty_print ?std:None ppf (yojson_of x)

let (^/) = Filename.concat

let catch f x = try Ok (f x) with e -> Error e

let of_yojson conv j =
  try Ok (conv j) with
  | Ppx_yojson_conv_lib.Yojson_conv.Of_yojson_error (exn, j') ->
      Format.eprintf "@[<2>Decode failure: %s@ @[%a@]@]@."
        (Printexc.to_string exn)
        (Yojson.Safe.pretty_print ~std:false) j';
      Error (`Decode_failure j)

let of_yojson_string conv s =
  match catch Yojson.Safe.from_string s with
  | Error _ -> Error (`Not_json s)
  | Ok j -> of_yojson conv j
