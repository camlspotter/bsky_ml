(** CAR file *)

module Cid : sig
  type t =
    | V0 of string
    | V1 of { codec : int; hash_function_code : int; digest : string }

  val pp : Format.formatter -> t -> unit

  val decode : t ParserM.t

  val encode : t -> string
end

val header : Cbor.t ParserM.t

type block = [ `Dag_cbor of Cid.t * Cbor.t | `Raw of Cid.t * string ]

val block : block ParserM.t

val decode : (Cbor.t * block list) ParserM.t
