type t = private string

val parse :
  string ->
  [> `Plc of string
  | `Web of string
  | `Other of string * string list ] option

val to_string : t -> string
val of_string : string -> t option
val unsafe_of_string : string -> t
