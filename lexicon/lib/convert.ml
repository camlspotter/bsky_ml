open Ppxlib
open Ppxlib.Asttypes
open Ppxlib.Parsetree
module Ast_builder = Ast_builder.Make(struct let loc = Location.none end)
open Ast_builder

open Types2
open Blueskaml_base.Utils

let find_optional_field name kvs conv =
  let rec find_optional_field acc = function
    | [] -> None, kvs
    | (k,v)::kvs when k = name -> Some (conv v), List.rev_append acc kvs
    | kv::kvs -> find_optional_field (kv::acc) kvs
  in
  find_optional_field [] kvs

let find_optional_nullable_field name kvs conv =
  let rec find_optional_field acc = function
    | [] -> None, kvs
    | (k,`Null)::kvs when k = name -> None, List.rev_append acc kvs
    | (k,v)::kvs when k = name -> Some (conv v), List.rev_append acc kvs
    | kv::kvs -> find_optional_field (kv::acc) kvs
  in
  find_optional_field [] kvs

let find_required_field path name kvs conv =
  let rec find_required_field acc = function
    | [] -> fail_yojson path ("key " ^ name ^ " required") (`Assoc kvs)
    | (k,v)::kvs when k = name -> conv v, List.rev_append acc kvs
    | kv::kvs -> find_required_field (kv::acc) kvs
  in
  find_required_field [] kvs

let find_required_nullable_field path name kvs conv =
  let rec find_required_field acc = function
    | [] -> fail_yojson path ("key " ^ name ^ " required") (`Assoc kvs)
    | (k,`Null)::kvs when k = name -> None, List.rev_append acc kvs
    | (k,v)::kvs when k = name -> Some (conv v), List.rev_append acc kvs
    | kv::kvs -> find_required_field (kv::acc) kvs
  in
  find_required_field [] kvs

let loc = Location.none

let with_loc txt = { loc; txt }

let pexp_string s = Ast_builder.pexp_constant (Pconst_string (s, Location.none, None))

let pexp_some e = [%expr Some [%e e]]

let pexp_var s = Ast_builder.pexp_ident @@ with_loc @@ Longident.Lident s

let ppat_var s = Ast_builder.ppat_var @@ with_loc s

let rec ty_of_yojson (ty : ty) =
  match ty with
  | String _ -> [%expr string_of_yojson]
  | Format _ -> [%expr string_of_yojson]
  | Bytes _ -> [%expr bytes_of_yojson]
  | Token _ -> [%expr string_of_yojson]
  | Cid_link _ -> [%expr string_of_yojson]
  | Integer _ -> [%expr int64_of_yojson]
  | Boolean _ -> [%expr bool_of_yojson]
  | Unknown _ -> [%expr Fun.id]
  | Blob _ -> [%expr bytes_of_yojson]
  | Ref path -> pexp_var (Path.to_ocaml_name path ^ "_of_yojson")
  | Array { items; _ } ->
      [%expr list_of_yojson [%e ty_of_yojson items]]

let build_of_yojson_object (object_ : object_) =
  let path = object_.path in
  (* { ocaml_key1; ocaml_key2; ... } *)
  let record =
    match object_.fields with
    | [] -> [%expr ()]
    | _ ->
        Ast_builder.pexp_record
          (List.map (fun { ocaml_key; _ } ->
               let lid = with_loc @@ Longident.Lident ocaml_key in
               (lid, Ast_builder.pexp_ident lid)) object_.fields)
          None
  in
  let cty =
    Ast_builder.(
      ptyp_constr (Located.lident (Path.to_ocaml_name path)) []
    )
  in
  let binder =
    List.fold_right (fun ({key; ocaml_key; ty; optional; nullable; _}) e ->
        let conv = ty_of_yojson ty in
        if not optional then
          if nullable then
            [%expr
              let [%p ppat_var ocaml_key], kvs =
                find_required_nullable_field
                  path_string
                  [%e pexp_string key]
                  kvs
                  [%e conv]
              in
              [%e e]
            ]
          else
            [%expr
              let [%p ppat_var ocaml_key], kvs =
                find_required_field
                  path_string
                  [%e pexp_string key]
                  kvs
                  [%e conv]
              in
              [%e e]
            ]
        else
        if nullable then
          [%expr
            let [%p ppat_var ocaml_key], kvs =
              find_optional_nullable_field
                [%e pexp_string key]
                kvs
                [%e conv]
            in
            [%e e]
          ]
        else
          [%expr
            let [%p ppat_var ocaml_key], kvs =
              find_optional_field
                [%e pexp_string key]
                kvs
                [%e conv]
            in
            [%e e]
          ]
      ) object_.fields
      [%expr
        let kvs = List.filter (function ("$type", _) -> false | _ -> true) kvs in
        if kvs <> [] then
          fail_yojson path_string ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
            (`Assoc kvs)
        else ( [%e record ] : [%t cty ] )
      ]
  in
  let loc = Location.none in
  let fn = Path.to_ocaml_name path ^ "_of_yojson" in
  fn,
  [%expr
    fun json ->
      let path_string = [%e pexp_string @@ Path.to_string path] in
      match json with
      | `Assoc kvs -> [%e binder]
      | _ -> fail_yojson path_string "Assoc expected" json
  ]

module String_set = Set.Make(String)

let build_of_yojson_union (union : union) =
  let path = union.path in
  let loc = Location.none in
  let fn = Path.to_ocaml_name path ^ "_of_yojson" in
  let case (constr : constructor) =
    let path = constr.path in
    let n = Path.to_string path in
    let tyname = Path.to_ocaml_name constr.path in
    let conv = tyname ^ "_of_yojson" in
    Ast_builder.case ~lhs:(Ast_builder.pstring n) ~guard:None
      ~rhs:( Ast_builder.(pexp_construct
                            (Located.lident constr.ocaml_name)
                            (Some [%expr [%e pexp_var conv ] json])))
  in
  let cases =
    Ast_builder.pexp_match
      (pexp_var "type_")
      @@ List.map (fun constr -> case constr) union.constrs
         @ [ Ast_builder.case ~lhs:Ast_builder.ppat_any ~guard:None
               ~rhs:[%expr fail_yojson path_string "Unexpected $type" json] ]
  in
  let cty =
    Ast_builder.(
      ptyp_constr (Located.lident (Path.to_ocaml_name path)) []
    )
  in
  fn,
  [%expr
    fun json ->
      let path_string = [%e pexp_string @@ Path.to_string path] in
      match json with
      | `Assoc kvs ->
          let type_, _rest =
            find_required_field path_string "$type" kvs string_of_yojson
          in
          ([%e cases] : [%t cty ])
      | json -> fail_yojson path_string "Assoc expected" json
  ]

let build_of_yojson_alias (alias : alias) =
  let fn = Path.to_ocaml_name alias.path ^ "_of_yojson" in
  fn, ty_of_yojson alias.ty

let build_of_yojson (typedecl : typedecl) =
  match typedecl.datatype with
  | Object object_ ->
      build_of_yojson_object object_
  | Union union ->
      build_of_yojson_union union;
  | Alias alias ->
      build_of_yojson_alias alias

let rec yojson_of_ty (ty : ty) =
  match ty with
  | String _ -> [%expr yojson_of_string]
  | Format _ -> [%expr yojson_of_string]
  | Bytes _ -> [%expr yojson_of_bytes]
  | Token _ -> [%expr yojson_of_string]
  | Cid_link _ -> [%expr yojson_of_string]
  | Integer _ -> [%expr yojson_of_int64]
  | Boolean _ -> [%expr yojson_of_bool]
  | Unknown _ -> [%expr Fun.id]
  | Blob _ -> [%expr yojson_of_bytes]
  | Ref path -> pexp_var ("yojson_of_" ^ Path.to_ocaml_name path)
  | Array { items; _ } ->
      [%expr yojson_of_list [%e yojson_of_ty items]]

let build_yojson_of_object (object_ : object_) =
  let open Ast_builder in
  let path = object_.path in
  let make_field key e = pexp_tuple [pexp_string key; e] in
  let type_ = Path.to_string object_.path in
  let field f =
    match f.optional, f.nullable with
    | false, false ->
        pexp_some
        @@ make_field f.key
          [%expr [%e yojson_of_ty f.ty]
              [%e pexp_field [%expr _object_] (Located.lident f.ocaml_key)]]
    | true, _ ->
        [%expr Option.map (fun v ->
            [%e make_field f.key
                [%expr [%e yojson_of_ty f.ty] v]])
            [%e pexp_field [%expr _object_] (Located.lident f.ocaml_key)]]
    | false, true ->
        pexp_some
        @@ make_field f.key
          [%expr
            match
              [%e pexp_field [%expr _object_] (Located.lident f.ocaml_key)]
            with
            | None -> `Null
            | Some v -> [%e yojson_of_ty f.ty] v]
  in
  let fields =
    pexp_some (make_field "$type" [%expr `String [%e pexp_string type_]])
    :: List.map field object_.fields
  in
  let fn = "yojson_of_" ^ Path.to_ocaml_name path in
  let ocaml_type = Path.to_ocaml_name object_.path in
  let core_type = ptyp_constr (Ast_builder.Located.lident ocaml_type) [] in
  pvar fn,
  [%expr
    fun (_object_ : [%t core_type ]) ->
      `Assoc (List.filter_map Fun.id [%e elist fields])
  ]

let build_yojson_of_union (union : union) =
  let open Ast_builder in
  let path = union.path in
  let case (constr : constructor) =
    (* | Foo x -> yojson_of_foo x *)
    let tyname = Path.to_ocaml_name constr.path in
    let conv = "yojson_of_" ^ tyname in
    case
      ~lhs:(ppat_construct (Located.lident constr.ocaml_name)
              (Some (ppat_var (Located.mk "x"))))
      ~guard:None
      ~rhs:([%expr [%e evar conv] x])
  in
  let cases =
    Ast_builder.pexp_match [%expr union]
    @@ List.map case union.constrs
  in
  let fn = "yojson_of_" ^ Path.to_ocaml_name path in
  let ocaml_type = Path.to_ocaml_name union.path in
  let core_type = ptyp_constr (Ast_builder.Located.lident ocaml_type) [] in
  pvar fn,
  [%expr
    fun (union : [%t core_type ]) -> [%e cases]
  ]

let build_yojson_of_alias (alias : alias) =
  let open Ast_builder in
  let fn = "yojson_of_" ^ Path.to_ocaml_name alias.path in
  pvar fn, yojson_of_ty alias.ty

let build_yojson_of (typedecl : typedecl) =
  match typedecl.datatype with
  | Object object_ ->
      build_yojson_of_object object_
  | Union union ->
      build_yojson_of_union union
  | Alias alias ->
      build_yojson_of_alias alias

let module_name_of_path path =
  match path with
  | Path.{ nsid; names= ([] | ["main"]) } ->
      let mname, rest =
        match
          List.rev
          @@ String.split_on_char '.'
            (Blueskaml_base.Types.Nsid.to_string nsid)
        with
        | n::rest -> String.capitalize_ascii n, List.rev rest
        | [] -> assert false
      in
      let group =
        match rest with
        | "com" :: "atproto" :: rest -> "atproto" :: rest
        | "app" :: "bsky" :: rest -> "bsky" :: rest
        | _ -> rest
      in
      let group = List.map String.capitalize_ascii group in
      mname, group
  | _ ->
      Format.eprintf "??? %a@." Path.pp path;
      assert false

(* Query

module ResolveHandle =
  Query(struct
    let nsid = Nsid.unsafe_of_string "com.atproto.identity.resolveHandle"
    type parameters = Lexicon.identity_resolveHandle_parameters [@@deriving yojson]
    type output = Lexicon.identity_resolveHandle_output [@@deriving yojson]
  end)

*)
let build_query path ~description:_ ~parameters ~output ~errors:_ =
  let mname, group = module_name_of_path path in
  let loc = Location.none in
  let parameters =
    Option.(value ~default:cty_unit @@ map cty_of_ty parameters)
  in
  let output =
    Option.(value ~default:cty_unit @@ map cty_of_ty output.schema)
  in
  let intf =
    [%str
      let nsid = Nsid.unsafe_of_string [%e pexp_string (Path.to_string path)]
      type parameters = [%t parameters ] [@@deriving yojson]
      type output = [%t output ] [@@deriving yojson]
    ]
  in
  let mb =
    module_binding
      ~name:(Located.mk (Some mname))
      ~expr:(pmod_apply
               (pmod_ident (Located.lident "Query"))
               (pmod_structure intf))
  in
  group, pstr_module mb

(* Procedure

module CreateSession =
  Procedure(struct
    let nsid = Nsid.unsafe_of_string "com.atproto.server.createSession"
    type input = Lexicon.server_createSession_input [@@deriving yojson]
    type output = Lexicon.server_createSession_output [@@deriving yojson]
  end)
*)
let build_procedure path ~description:_ ~input ~output ~errors:_ =
  let mname, group = module_name_of_path path in
  let loc = Location.none in
  let input =
    Option.value ~default:cty_unit
    @@ match input with
    | None -> None
    | Some input -> Option.map cty_of_ty input.schema
  in
  let output =
    Option.value ~default:cty_unit
    @@ match output with
    | None -> None
    | Some output -> Option.map cty_of_ty output.schema
  in
  let intf =
    [%str
      let nsid = Nsid.unsafe_of_string [%e pexp_string (Path.to_string path)]
      type input = [%t input ] [@@deriving yojson]
      type output = [%t output ] [@@deriving yojson]
    ]
  in
  let mb =
    module_binding
      ~name:(Located.mk (Some mname))
      ~expr:(pmod_apply
               (pmod_ident (Located.lident "Procedure"))
               (pmod_structure intf))
  in
  group, pstr_module mb

let build_xrpc (path, def) =
  match def with
  | Datatype _ -> None
  | Query { description; parameters; output; errors } ->
      Some (build_query path ~description ~parameters ~output ~errors)
  | Procedure { description; input; output; errors } ->
      Some (build_procedure path ~description ~input ~output ~errors)
  | _ -> None
