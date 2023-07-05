type t = private Uri.t

val authority : t -> string
val path : t -> string
val query : t -> (string * string list) list
val fragment : t -> string option

val is_valid : Uri.t -> bool

val to_string : t -> string
val of_string : string -> t option
val unsafe_of_uri : Uri.t -> t
