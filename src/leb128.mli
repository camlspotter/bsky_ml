module Unsigned : sig
  val encode : int -> string
  val decode : int ParserM.t
end
