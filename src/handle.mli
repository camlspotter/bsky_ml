(* Ex. [foobar.bsky.social] *)
type t = private string

val to_string : t -> string

(* TODO: currently no validity check *)
val of_string : string -> t option

val unsafe_of_string : string -> t
