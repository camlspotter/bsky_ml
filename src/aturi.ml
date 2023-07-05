(* AT URI Scheme (at://)
   https://atproto.com/specs/at-uri-scheme
*)

type t = Uri.t

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

let unsafe_of_uri t = t
