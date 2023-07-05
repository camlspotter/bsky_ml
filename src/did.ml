type t = string

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
