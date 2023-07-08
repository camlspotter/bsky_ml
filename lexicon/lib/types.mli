(** The types of AT protocol's lexicons *)

open Blueskaml_base
open Utils
open Types

type 'ty object_ = {
  description : string option;
  required : string list option;
  nullable : string list option;
  properties : 'ty jrecord;
} [@@deriving yojson]

type token = { description : string; } [@@deriving yojson]

type string_ = {
  format : string option;
  description : string option;
  knownValues : string list option;
  minLength : int option;
  maxLength : int option;
  maxGraphemes : int option;
  default : string option;
} [@@deriving yojson]

type bytes_ = {
  format : string option;
  description : string option;
  maxLength : int option;
} [@@deriving yojson]

type integer = {
  minimum : int64 option;
  maximum : int64 option;
  default : int64 option;
  description : string option;
} [@@deriving yojson]

type boolean = {
  description : string option;
  default : bool option;
  const : bool option;
} [@@deriving yojson]

type 'ty array_ = {
  description : string option;
  maxLength : int option;
  items : 'ty;
} [@@deriving yojson]

type ref_id = {
  nsid : Nsid.t option;
  name : string
} [@@deriving yojson]

val parse_ref_id : string -> ref_id

type ref_ = {
  ref : ref_id
} [@@deriving yojson]

type union = { refs : ref_id list; closed : bool option; } [@@deriving yojson]

type unknown = { description : string option; } [@@deriving yojson]

type cid_link = { description : string option; } [@@deriving yojson]

type blob = { accept : string list option; maxSize : int option; } [@@deriving yojson]

type 'ty type_ =
  | Object of 'ty object_ [@name "object"]
  | Params of 'ty object_ [@name "params"] (* only used in query *)
  | String of string_ [@name "string"]
  | Bytes of bytes_ [@name "bytes"]
  | Token of token [@name "token"]
  | Array of 'ty array_ [@name "array"]
  | Union of union [@name "union"]
  | Integer of integer [@name "integer"]
  | Boolean of boolean [@name "boolean"]
  | Unknown of unknown [@name "unknown"]
  | Cid_link of cid_link [@name "cid-link"]
  | Blob of blob [@name "blob"]
  | Ref of ref_ [@name "ref"]
[@@deriving yojson]

type ty = Ty of ty type_ [@@deriving yojson]

type error = { name : string; } [@@deriving yojson]

type message =
  { schema : ty } [@@deriving yojson]

type subscription =
  { description : string option;
    parameters : ty;
    message : message;
    errors : error list
  } [@@deriving yojson]

type input =
  { encoding : string;
    schema : ty option;
  } [@@deriving yojson]

type output =
  { encoding : string;
    schema : ty option;
  } [@@deriving yojson]

type query =
  { description : string option;
    parameters : ty option;
    output : output;
    errors : error list option;
  } [@@deriving yojson]

type procedure =
  { description : string;
    input : input option;
    output : output option;
    errors : error list option;
  } [@@deriving yojson]

(** Collection of [ty] whose key is [key] *)
type record =
  { description : string option;
    key : string;
    record : ty (* always object I think *)
  } [@@deriving yojson]

type def =
  | Subscription of subscription
  | Query of query
  | Record of record
  | Procedure of procedure
  | Typedef of ty
[@@deriving yojson]

type lexicon = {
  lexicon : int;
  id : Nsid.t;
  description : string option;
  defs : def jrecord;
} [@@deriving yojson]

val load_lexicon :
  string -> (lexicon, [> `Decode_failure of Yojson.Safe.t ]) result
