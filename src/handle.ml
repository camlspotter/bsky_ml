type t = string

(* TODO: https://atproto.com/specs/handle *)
let is_valid _ = true

let to_string s = s
let of_string s = if is_valid s then Some s else None
let unsafe_of_string s = s
