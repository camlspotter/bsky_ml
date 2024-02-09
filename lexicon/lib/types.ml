open Bsky_ml_base
open Utils
open Types

let add_type t assoc =
  match assoc with
  | `Assoc kvs -> `Assoc ( ("type", `String t) :: kvs )
  | _ -> invalid_arg "add_type"

type error =
  { name : string;
    description : string option [@yojson.option];
  } [@@deriving yojson]

type 'ty object_ =
  { description : string option [@yojson.option];
    required : string list option [@yojson.option];
    nullable : string list option [@yojson.option];
    properties : 'ty jrecord;
  } [@@deriving yojson]

type token =
  { description : string }
  [@@deriving yojson]

type string_ =
  { format : string option [@yojson.option];
    description : string option [@yojson.option];
    knownValues: string list option [@yojson.option];
    enum : string list option [@yojson.option];
    minLength : int option [@yojson.option];
    maxLength : int option [@yojson.option];
    maxGraphemes : int option [@yojson.option];
    default: string option [@yojson.option];
  } [@@deriving yojson]

type bytes_ =
  { format : string option [@yojson.option];
    description : string option [@yojson.option];
    maxLength : int option [@yojson.option];
  } [@@deriving yojson]

type integer =
  { minimum : int64 option [@yojson.option];
    maximum : int64 option [@yojson.option];
    default : int64 option [@yojson.option];
    description : string option [@yojson.option];
  } [@@deriving yojson]

type boolean =
  { description : string option [@yojson.option];
    default : bool option [@yojson.option];
    const : bool option [@yojson.option];
  } [@@deriving yojson]

type 'ty array_ =
  { description : string option [@yojson.option];
    maxLength : int option [@yojson.option];
    items : 'ty } [@@deriving yojson]

type ref_id = {
  nsid : Nsid.t option;
  name : string
}

let yojson_of_ref_id { nsid; name } =
  match nsid, name with
  | None, _ -> `String ("#" ^ name)
  | Some nsid, "main"  -> `String (Nsid.to_string nsid)
  | Some nsid, _ -> `String (Nsid.to_string nsid ^ "#" ^ name)

let parse_ref_id s =
  match String.index s '#' with
  | exception _ -> { nsid = Some (Option.get @@ Nsid.of_string s); name= "main" }
  | i ->
      let nsid = String.sub s 0 i in
      let name = String.(sub s (i+1) (length s - i - 1)) in
      if nsid = "" then { nsid= None; name }
      else { nsid= Some (Option.get @@ Nsid.of_string nsid); name }

let ref_id_of_yojson = function
  | `String s -> parse_ref_id s
  | j -> fail_yojson "ref_" "expects string" j

type ref_ = {
  ref : ref_id
} [@@deriving yojson]

type union =
  { refs : ref_id list;
    closed : bool option [@yojson.option]
  } [@@deriving yojson]

type unknown =
  { description : string option [@yojson.option];
  } [@@deriving yojson]

type cid_link =
  { description : string option [@yojson.option];
  } [@@deriving yojson]

type blob =
  { accept : string list option [@yojson.option];
    maxSize : int option [@yojson.option];
  } [@@deriving yojson]

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

type ty = Ty of ty type_

let rec yojson_of_ty (Ty ty) =
  match yojson_of_type_ yojson_of_ty ty with
  | `Variant (n, Some t) -> add_type n t
  | `List [`String n; t] -> add_type n t
  | _ -> assert false

let rec ty_of_yojson j =
  let fail_yojson = fail_yojson "ty" in
  match j with
  | `Assoc kvs ->
      let type_ =
        match List.assoc_opt "type" kvs with
        | Some (`String jty) -> jty
        | _ -> fail_yojson "type field expected" j
      in
      let j' = `List [`String type_; `Assoc (List.filter (fun (k,_) -> k <> "type") kvs)] in
      let ty' = type__of_yojson ty_of_yojson j' in
      Ty ty'
  | _ -> fail_yojson "Assoc expected" j

type message =
  { schema : ty } [@@deriving yojson]

type subscription =
  { description : string option [@yojson.option];
    parameters : ty;
    message : message;
    errors : error list
  } [@@deriving yojson]

type input =
  { encoding : string;
    schema : ty option [@yojson.option];
  } [@@deriving yojson]

type output =
  { encoding : string;
    schema : ty option [@yojson.option];
  } [@@deriving yojson]

type query =
  { description : string option [@yojson.option];
    parameters : ty option [@yojson.option];
    output : output;
    errors : error list option [@yojson.option];
  } [@@deriving yojson]

type procedure =
  { description : string;
    input : input option [@yojson.option];
    output : output option [@yojson.option];
    errors : error list option [@yojson.option];
    parameters : ty option [@yojson.option];
  } [@@deriving yojson]

(** Collection of [ty] whose key is [key] *)
type record =
  { description : string option [@yojson.option];
    key : string;
    record : ty (* always object I think *)
  } [@@deriving yojson]

type def =
  | Subscription of subscription [@name "subscription"]
  | Query of query [@name "query"]
  | Record of record [@name "record"]
  | Procedure of procedure [@name "procedure"]
  | Typedef of ty [@name "typedef"]
[@@deriving yojson]

let yojson_of_def' = yojson_of_def
let def'_of_yojson = def_of_yojson

let yojson_of_def s =
  match yojson_of_def' s with
  | `Variant ("typedef", Some t) -> t
  | `List [`String "typedef"; t] -> t
  | `Variant (n, Some t) -> add_type n t
  | `List [`String n; t] -> add_type n t
  | _ -> assert false

let def_of_yojson j =
  let fail_yojson = fail_yojson "def" in
  match j with
  | `Assoc kvs ->
      let type_ =
        match List.assoc_opt "type" kvs with
        | Some (`String jty) -> jty
        | _ -> fail_yojson "type field expected" j
      in
      (match type_ with
       | "subscription" | "query" | "record" | "procedure" | "params" ->
           let j' = `List [`String type_; `Assoc (List.filter (fun (k,_) -> k <> "type") kvs)] in
           def'_of_yojson j'
       | _ ->
           Typedef (ty_of_yojson j))
  | _ -> fail_yojson "Assoc expected" j

type lexicon = {
  lexicon : int;
  id : Nsid.t;
  description : string option [@yojson.option];
  defs : def jrecord;
} [@@deriving yojson]

let load_lexicon fn =
  let j = Yojson.Safe.from_file fn in
  of_yojson lexicon_of_yojson j
