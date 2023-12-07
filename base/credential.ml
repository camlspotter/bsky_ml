open Ppx_yojson_conv_lib

type t =
  { identifier : string;
    password : string;
  } [@@deriving yojson]

let load fn =
  try
    Ok (t_of_yojson @@ Yojson.Safe.from_file fn)
  with
  | e -> Error (`Exn e)
