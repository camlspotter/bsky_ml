(* Extends CBOR *)

exception Error of string

type t =
  [ `Array of t list
  | `Bool of bool
  | `Bytes of string
  | `Float of float
  | `Int of int
  | `Map of (t * t) list
  | `Null
  | `Simple of int
  | `Tag of int * t
  | `Text of string
  | `Undefined ]

val encode : t -> string
val decode : string -> t
val decode_partial : string -> t * string
val to_diagnostic : t -> string

val pp : Format.formatter -> t -> unit
