open Blueskaml_base.Types

module Path : sig
  type t = { nsid : Nsid.t; names : string list; }
  [@@deriving yojson]

  val compare : t -> t -> int
  val sort_uniq : t list -> t list
  val to_string : t -> string
  val pp : Format.formatter -> t -> unit
  val to_ocaml : t -> string list
  val to_ocaml_name : t -> string
  val append : t -> string -> t
end

type error = { name : string; } [@@deriving yojson]

type ty =
  | String of string_
  | Format of format
  | Bytes of bytes_
  | Token of token
  | Array of array_
  | Integer of integer
  | Boolean of boolean
  | Unknown of unknown
  | Cid_link of cid_link
  | Blob of blob
  | Ref of Path.t

and field = {
  key : string;
  ocaml_key : string;
  optional : bool;
  nullable : bool;
  ty : ty;
}

and token = { description : string; }

and string_ = {
  description : string option;
  knownValues : string list option;
  minLength : int option;
  maxLength : int option;
  maxGraphemes : int option;
  default : string option;
}

and format =
  { format : string;
    description : string option;
    knownValues : string list option;
    minLength : int option;
    maxLength : int option;
    maxGraphemes : int option;
    default : string option;
  }

and bytes_ = {
  format : string option;
  description : string option;
  maxLength : int option;
}

and integer = {
  minimum : int64 option;
  maximum : int64 option;
  default : int64 option;
  description : string option;
}

and boolean = {
  description : string option;
  default : bool option;
  const : bool option;
}

and array_ = {
  path : Path.t;
  description : string option;
  maxLength : int option;
  items : ty;
}

and constructor =
  { ocaml_name : string;
    path : Path.t;
  }

and unknown = { description : string option; }

and cid_link = { description : string option; }

and blob = { accept : string list option; maxSize : int option; }

and object_ =
  { path : Path.t;
    description : string option;
    fields : field list;
    deps : Path.t list;
  }

and union =
  { path : Path.t;
    constrs : constructor list;
    closed : bool option;
    deps : Path.t list;
  }

and alias =
  { path : Path.t;
    ty : ty;
    deps : Path.t list;
  }

and datatype =
  | Object of object_
  | Union of union
  | Alias of alias

and input_output = { encoding : string; schema : ty option; }

and def =
  | Subscription of
      { description : string option;
        parameters : ty;
        message : ty;
        errors : error list
      }
  | Query of
      { description : string option;
        parameters : ty option;
        output : input_output;
        errors : error list
      }
  | Procedure of
      { description : string;
        input : input_output option;
        output : input_output option;
        errors : error list
      }
  | Record of
      { description : string option;
        key : string;
        ty : ty
      }

  | Datatype of datatype
[@@deriving yojson]

val conv_def : Path.t -> Types.def -> def list

type typedecl = {
  path : Path.t;
  decl : Ppxlib.type_declaration;
  description : string option;
  datatype : datatype;
  deps : Path.t list;
}

val pp_typedecl : Format.formatter -> typedecl -> unit

val typedecl_of_ty : Path.t -> ty -> typedecl option
val typedecls_of_def : Path.t -> def -> typedecl list

val build_graph : typedecl list -> typedecl list list

val cty_of_ty : ty -> Ppxlib.core_type
val cty_unit : Ppxlib.core_type
