(* OCaml type system friendly definitions of lexicon types *)

open Blueskaml_base.Utils
open Blueskaml_base.Types

let ocaml_name_of_format s =
  String.(uncapitalize_ascii @@ map (function '-' -> '_' | c -> c) s)

module Path = struct
  type t = { nsid : Nsid.t; names : string list }
  [@@deriving yojson]

  let compare : t -> t -> int = Stdlib.compare

  let sort_uniq = List.sort_uniq compare

  let to_string t =
    let t =
      match t.names with
      | ["main"] -> {t with names = []}
      | _ -> t
    in
    match t.names with
    | [] -> Nsid.to_string t.nsid
    | _ -> Nsid.to_string t.nsid ^ "#" ^ String.concat "/" t.names

  let pp ppf t = Format.pp_print_string ppf @@ to_string t

  let to_ocaml { nsid; names } =
    let nsid =
      let ts = String.split_on_char '.' (Nsid.to_string nsid) in
      let ts = List.map ocaml_name_of_format (* bad function name xxx *) ts in
      let ts =
        (* drop com.atproto and app.bsky *)
        match ts with
        | "com" :: "atproto" :: ts -> ts
        | "app" :: "bsky" :: ts -> ts
        | _ -> ts
      in
      (* drop "defs" *)
      match List.rev ts with
      | "defs" :: rev_ts -> List.rev rev_ts
      | _ -> ts
    in
    (* drop "main" *)
    let names =
      match names with
      | "main" :: names -> names
      | _ -> names
    in
    nsid @ names

  let to_ocaml_name p = String.concat "_" @@ to_ocaml p

  let append t s = { t with names = t.names @ [s] }
end

let resolve_ref_id cur_id (ref_id : Types.ref_id) =
  match cur_id, ref_id with
  | nsid, Types.{nsid=None; name} ->
      let ref_id = Types.{ nsid= Some nsid; name } in
(*
      Format.eprintf "%a => %a@."
        (pp_as_json Types.yojson_of_ref_id) ref_id
        (pp_as_json Types.yojson_of_ref_id) ref_id;
*)
      ref_id
  | _, {nsid=Some _nsid; name=_} -> ref_id

type error = Types.error =
  { name : string
  } [@@deriving yojson]

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

and field =
  { key : string;
    ocaml_key : string; (* ex "type_" instead of "type" *)
    optional : bool;
    nullable : bool;
    ty : ty
  }

and token = Types.token =
  { description : string }

and string_ =
  { description : string option;
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

and bytes_ = Types.bytes_ =
  { format : string option;
    description : string option;
    maxLength : int option;
  }

and integer = Types.integer =
  { minimum : int64 option;
    maximum : int64 option;
    default : int64 option;
    description : string option;
  }

and boolean = Types.boolean =
  { description : string option;
    default : bool option;
    const : bool option;
  }

and array_ =
  { path : Path.t;
    description : string option;
    maxLength : int option;
    items : ty
  }

and constructor =
  { ocaml_name : string;
    path : Path.t;
  }

and unknown = Types.unknown =
  { description : string option }

and cid_link = Types.cid_link =
  { description : string option }

and blob = Types.blob =
  { accept : string list option;
    maxSize : int option;
  }

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

and input_output =
  { encoding : string;
    schema : ty option
  }

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

let rec extra_defs path (Types.Ty type_) =
  match type_ with
  | Types.String string_ ->
      (match string_.format with
       | None -> []
       | Some format ->
           let path = Path.{nsid= Nsid.unsafe_of_string format; names= []} in
           [path, `Alias (Types.Ty type_)])
  | Bytes _
  | Token _
  | Integer _
  | Boolean _
  | Unknown _
  | Cid_link _
  | Blob _ -> []
  | Object object_
  | Params object_ ->
      (path, `Object object_) ::
      List.concat_map (fun (k,ty) ->
          extra_defs (Path.append path k) ty) object_.properties
  | Array array_ ->
      extra_defs (Path.append path "item") array_.items
  | Union union ->
      [(path, `Union union)] (*? *)
  | Ref _ -> []

let ocaml_record_field_name s =
  let s = String.uncapitalize_ascii s in
  match s with
  | "val" | "external" | "end" | "type" -> s ^ "_"
  | s -> s

let build_constructors paths =
  let rev_tokens_list =
    List.map (fun path -> List.rev @@ Path.to_ocaml path) paths
  in
  (* drop the names if they are all the same *)
  let rev_tokens_list =
    let heads = List.(map hd rev_tokens_list) in
    let n_heads_uniq = List.(length @@ sort_uniq String.compare heads) in
    if n_heads_uniq = 1 then List.(map tl rev_tokens_list)
    else rev_tokens_list
  in
  let n_uniq xs =
    List.(length @@ sort_uniq (List.compare String.compare) xs)
  in
  if List.length rev_tokens_list <> n_uniq rev_tokens_list then
    invalid_arg "build_constructors"
  else
    let rec loop n =
      let xs = List.map (List.take n) rev_tokens_list in
      if List.length xs = n_uniq xs then xs
      else if n > 10 then assert false else loop (n+1)
    in
    let rev_constructors = loop 1 in
    List.map (fun rev_ns ->
        String.capitalize_ascii @@ String.concat "_" @@ List.rev rev_ns)
        rev_constructors

let rec conv_ty path (Types.Ty type_) : ty =
  match type_ with
  | Types.String string_ ->
      (match string_.format with
       | None ->
           String { description = string_.description;
                    knownValues = string_.knownValues;
                    minLength = string_.minLength;
                    maxLength = string_.maxLength;
                    maxGraphemes = string_.maxGraphemes;
                    default = string_.default }
       | Some format ->
           Format { format; description = string_.description;
                    knownValues = string_.knownValues;
                    minLength = string_.minLength;
                    maxLength = string_.maxLength;
                    maxGraphemes = string_.maxGraphemes;
                    default = string_.default })
  | Bytes bytes_ -> Bytes bytes_
  | Token token -> Token token
  | Integer integer -> Integer integer
  | Boolean boolean -> Boolean boolean
  | Unknown unknown -> Unknown unknown
  | Cid_link cid_link -> Cid_link cid_link
  | Blob blob -> Blob blob
  | Object _object_ -> Ref path (* Object (conv_object_ path object_) *)
  | Params _object_ -> Ref path (* Object (conv_object_ path object_) *)
  | Array array_ ->
      let array_ =
        { path;
          description = array_.description;
          maxLength = array_.maxLength;
          items = conv_ty (Path.append path "item") array_.items
        }
      in
      Array array_
  | Union _union -> Ref path
  | Ref ref_ ->
      let { nsid; name } : Types.ref_id = ref_.ref in
      let nsid =
        match nsid with
        | Some nsid -> nsid
        | None -> path.nsid
      in
      let path = Path.{ nsid; names= [name] } in
      Ref path

let conv_union (path : Path.t) (union : Types.union) =
  let conv_ref (ref_id : Types.ref_id) =
    let ref_id = resolve_ref_id path.nsid ref_id in
    let nsid = Option.get ref_id.nsid in
    let name = ref_id.name in
    let path : Path.t = { nsid; names= [name]} in
    path
  in
  let paths = List.map conv_ref union.refs in
  let cs = build_constructors paths in
  let constrs =
    List.map (fun (c, path) -> { ocaml_name= c; path })
    @@ List.combine cs paths
  in
  Union { path; constrs; closed = union.closed; deps= paths }

let rec deps_ty (ty : ty) : Path.t list =
  match ty with
  | String _ | Bytes _ | Token _ | Integer _ | Boolean _
  | Unknown _ | Cid_link _ | Blob _ -> []
  | Format format ->
      let path = Path.{nsid= Nsid.unsafe_of_string format.format; names=[]} in
      [path]
  | Array array_ -> deps_ty array_.items
  | Ref path -> [path]

let conv_object_ path (object_ : Types.ty Types.object_) =
  let fields =
    List.map (fun (k, ty) ->
      let path = Path.append path k in
      { key= k;
        ocaml_key = ocaml_record_field_name k;
        optional = not @@ List.mem k @@ Option.value ~default:[] object_.required;
        nullable = List.mem k @@ Option.value ~default:[] object_.nullable;
        ty = conv_ty path ty
      }) object_.properties
  in
  let deps =
    List.sort_uniq Path.compare @@
    List.concat_map (fun ({ ty; _ } : field) -> deps_ty ty) fields
  in
  Object { path;
           description= object_.description;
           fields;
           deps;
         }

let make_alias path ty =
  match ty with
  | Ref path' when path = path' -> assert false
  | _ -> Alias { path; ty; deps= deps_ty ty }

let conv_alias path ty =
  let ty = conv_ty path ty in
  make_alias path ty

let conv_ty path ty0 =
  let ty = conv_ty path ty0 in
  let ptys = extra_defs path ty0 in
  let rec loop acc = function
    | [] -> acc
    | (p,`Object (object_ : _ Types.object_)) :: ptys ->
        let ptys' =
          List.concat_map (fun (k,ty) ->
              let path = Path.append p k in
              extra_defs path ty) object_.properties
        in
        let dt = conv_object_ p object_ in
        loop (dt::acc) (ptys' @ ptys)
    | (p,`Union union) :: ptys ->
        let dt = conv_union p union in
        loop (dt::acc) ptys
    | (p,`Alias ty) :: ptys ->
        let dt = conv_alias p ty in
        loop (dt::acc) ptys
  in
  ty, loop [] ptys

let check_datatype dt =
  match dt with
  | Alias { path; ty = Ref path'; _ } ->
      assert (path <> path')
  | _ -> ()

let conv_def path (def : Types.def) : def list =
  match def with
  | Subscription subscription ->
      let parameters, dts =
        conv_ty (Path.append path "parameters") subscription.parameters
      in
      let message, dts' =
        conv_ty (Path.append path "message") subscription.message.schema
      in
      List.iter check_datatype dts;
      List.iter check_datatype dts';
      List.map (fun dt -> Datatype dt) (dts @ dts')
      @ [Subscription
           { description= subscription.description;
             parameters;
             message;
             errors = subscription.errors
           }]
  | Query query ->
      let parameters, dts =
        match query.parameters with
        | None -> None, []
        | Some parameters ->
            let parameters, dts =
              conv_ty (Path.append path "parameters") parameters
            in
            Some parameters, dts
      in
      let schema, dts' =
        match query.output.schema with
        | None -> None, []
        | Some schema ->
            let schema, dts =
              conv_ty (Path.append path "output") schema
            in
            Some schema, dts
      in
      List.iter check_datatype dts;
      List.iter check_datatype dts';
      List.map (fun dt -> Datatype dt) (dts @ dts')
      @ [Query
           { description = query.description;
             parameters;
             output = { encoding= query.output.encoding; schema };
             errors = Option.value ~default:[] query.errors
           }
        ]
  | Procedure procedure ->
      let input, dts =
        match procedure.input with
        | None -> None, []
        | Some input ->
            match input.schema with
            | None -> Some { encoding= input.encoding; schema= None }, []
            | Some schema ->
                let schema, dts = conv_ty (Path.append path "input") schema in
                Some { encoding= input.encoding; schema= Some schema }, dts
      in
      let output, dts' =
        match procedure.output with
        | None -> None, []
        | Some output ->
            match output.schema with
            | None -> Some { encoding= output.encoding; schema= None }, []
            | Some schema ->
                let schema, dts = conv_ty (Path.append path "output") schema in
                Some { encoding= output.encoding; schema= Some schema }, dts
      in
      List.iter check_datatype dts;
      List.iter check_datatype dts';
      List.map (fun dt -> Datatype dt) (dts @ dts')
      @ [Procedure
           { description = procedure.description;
             input;
             output;
             errors = Option.value ~default:[] procedure.errors
           }]
  | Record record ->
      let ty, dts = conv_ty path record.record in
      List.iter check_datatype dts;
      List.map (fun dt -> Datatype dt) dts
      @ [Record
           { description= record.description;
             key= record.key;
             ty;
           }]
  | Typedef ty ->
      let ty, dts = conv_ty path ty in
      List.iter check_datatype dts;
      List.map (fun dt -> Datatype dt) dts
      @ match ty with
      | Ref path' when path = path' -> []
      | _ ->
          let dt = make_alias path ty in
          check_datatype dt;
          [Datatype dt]

open Ppxlib.Asttypes
open Ppxlib.Parsetree

let loc_none = Location.none

let with_loc txt =
  let open Ppxlib.Asttypes in
  {txt; loc= loc_none}

let default_type_declaration =
  { ptype_name = with_loc "dummy";
    ptype_params = [];
    ptype_cstrs = [];
    ptype_kind = Ptype_abstract;
    ptype_private = Public;
    ptype_manifest = None;
    ptype_attributes = [];
    ptype_loc = loc_none
  }

let cty_abstract n tys =
  { ptyp_desc= Ptyp_constr (with_loc (Longident.Lident n), tys);
    ptyp_loc= loc_none;
    ptyp_loc_stack = [];
    ptyp_attributes= [] }

let cty_abstract_path path tys =
  cty_abstract (Path.to_ocaml_name path) tys

let cty_nullable ty = cty_abstract "nullable" [ty]

let cty_unit = cty_abstract "unit" []

let cty_option ty = cty_abstract "option" [ty]

let cty_string = cty_abstract "string" []

let cty_list ty = cty_abstract "list" [ty]

let cty_yojson = cty_abstract "Yojson.Safe.t" []

(*
let deps_of_format string_ fmt =
  [Path.{nsid= Nsid.unsafe_of_string fmt; names= []},
   Ty (String { string_ with format= None })]

let deps_of_blob (blob : blob) =
  [Path.{nsid= Nsid.unsafe_of_string "blob"; names= []},
   Ty (Bytes { format = None;
               description = Option.map (String.concat " ") blob.accept;
               maxLength = blob.maxSize (* ? *) })]
*)

(*
let path_of_ref_id ref_id =
  match (ref_id : Types.ref_id) with
  | { nsid= Some nsid; name } -> Path.{ nsid; names= [name] }
  | { nsid= None; name=_ } ->
      Format.eprintf "path_of_ref_id : %a@."
        (pp_as_json yojson_of_ref_id) ref_id;
      assert false
*)

let rec cty_of_ty (ty : ty) =
  match ty with
  | Ref path ->
      cty_abstract_path path []
  | String _string_ -> cty_abstract "string" []
  | Format format ->
      cty_abstract (ocaml_name_of_format format.format) []
  | Bytes _bytes -> cty_abstract "bytes" []
  | Blob _blob -> cty_abstract "blob" []
  | Integer _integer -> cty_abstract "int64" []
  | Boolean _boolean -> cty_abstract "bool" []
  | Unknown _unknown -> cty_abstract "unknown" []
  | Cid_link _ -> cty_abstract "cid_link" []
  | Array array_ -> cty_list (cty_of_ty array_.items)
  | Token _token -> cty_abstract "token" []
(*
  | Union union -> cty_abstract_path union.path []
  | Object object_ -> cty_abstract_path object_.path []
*)

type typedecl =
  { path : Path.t;
    decl : type_declaration;
    description : string option;
    datatype : datatype;
    deps : Path.t list;
  }

let pp_typedecl ppf td =
  let open Format in
  fprintf ppf "@[<v>path: %a;@ ty: @[%a@];@ deps: @[%a@];@]"
    Path.pp td.path
    (pp_as_json yojson_of_datatype) td.datatype
    (pp_print_list
       ~pp_sep:(fun ppf () -> fprintf ppf ";@ ")
       Path.pp) td.deps

let set_description desc td =
  match desc with
  | None -> td
  | Some d ->
      match td.description with
      | None -> { td with description= Some d }
      | Some d' -> { td with description= Some (d ^ "; " ^ d') }

(* type t = ty *)
let typedecl_of_alias path ty cty =
  let deps = deps_ty ty in
  let ocaml_name = Path.to_ocaml_name path in
  match ty with
  | Ref path' when path = path' ->
      (* Dirty workaround to avoid cyclic type defs *)
      None
  | _ ->
      Some
        { path;
          decl= { default_type_declaration with
                  ptype_name = with_loc ocaml_name;
                  ptype_kind = Ptype_abstract;
                  ptype_manifest = Some cty;
                };
          description= None;
          datatype= Alias { path; ty; deps };
          deps;
        }

(* type t = cty *)
let typedecl_of_ty path ty =
  match ty with
  | String string_ ->
      let cty = cty_abstract "string" [] in
      Option.map
        (set_description string_.description)
      @@ typedecl_of_alias path ty cty
  | Format format ->
      let cty = cty_abstract "string" [] in
      Option.map
        (set_description format.description)
      @@ typedecl_of_alias path ty cty
  | Token token ->
      Option.map
        (set_description (Some token.description))
      @@ typedecl_of_alias path ty cty_string
  | Ref path ->
      typedecl_of_alias path
        ty
        (cty_abstract_path path [])
  | Array array ->
      let cty_items = cty_of_ty array.items in
      Option.map
        (set_description array.description)
      @@ typedecl_of_alias path ty (cty_list cty_items)
  | Unknown unknown ->
      Option.map
        (set_description unknown.description)
      @@ typedecl_of_alias path ty cty_yojson
  | Integer _ -> None
  | Cid_link _ | Bytes _ | Boolean _ | Blob _ -> None

let typedecls_of_datatype datatype =
  match datatype with
  | Object { path; description; fields; deps } ->
      (* type t = { l:...; l:...; } *)
      let fields =
        List.fold_right (fun { optional; nullable; ty; ocaml_key; _ }  fields ->
            let pld_type =
              match optional, nullable with
              | false, false -> cty_of_ty ty
              | false, true ->
                  let cty = cty_of_ty ty in
                  cty_nullable cty
              | true, false ->
                  let cty = cty_of_ty ty in
                  cty_option cty
              | true, true ->
                  let cty = cty_of_ty ty in
                  cty_option cty
            in
            { pld_name = with_loc @@ ocaml_key;
              pld_mutable = Immutable;
              pld_type;
              pld_loc= loc_none;
              pld_attributes = [] } :: fields) fields []
      in
      [match fields with
      | [] ->
          { path;
            decl= { default_type_declaration with
                    ptype_name = with_loc (Path.to_ocaml_name path);
                    ptype_kind = Ptype_abstract;
                    ptype_manifest = Some cty_unit;
                  };
            description = description;
            datatype;
            deps
          }
      | _ ->
          { path;
            decl= { default_type_declaration with
                    ptype_name = with_loc (Path.to_ocaml_name path);
                    ptype_kind = Ptype_record fields;
                  };
            description = description;
            datatype;
            deps;
          }]
  | Union { path; constrs; closed=_; deps } ->
      (* type t = C of ... | C of .. *)
      let constructors =
        List.map (fun {ocaml_name= constr_name; path} ->
            { pcd_name = with_loc constr_name;
              pcd_vars = [];
              pcd_args = Pcstr_tuple [cty_abstract_path path []];
              pcd_res= None;
              pcd_loc= loc_none;
              pcd_attributes = [] }) constrs
      in
      [{ path;
         decl= { default_type_declaration with
                 ptype_name = with_loc (Path.to_ocaml_name path);
                 ptype_kind = Ptype_variant constructors;
               };
         description = None;
         datatype;
         deps }]
  | Alias { path; ty; deps=_ (* ??? *) } ->
      Option.to_list @@ typedecl_of_ty path ty

let typedecls_of_def path def =
  match def with
  | Datatype dt ->
      typedecls_of_datatype dt
  | Record { description=_; key=_; ty } ->
(*
      [ set_description description
        @@ Option.get @@ typedecl_of_ty path ty ]
*)
      Option.to_list @@ typedecl_of_ty path ty
  | Procedure { input; output; _ } ->
      let input =
        match input with
        | None -> []
        | Some io ->
            match io.schema with
            | None -> []
            | Some schema ->
                Option.to_list @@
                typedecl_of_ty (Path.append path "input") schema
      in
      let output =
        match output with
        | None -> []
        | Some io ->
            match io.schema with
            | None -> []
            | Some schema ->
                Option.to_list @@
                typedecl_of_ty (Path.append path "output") schema
      in
      input @ output
  | Query { parameters; output; _ } ->
      let parameters =
        match parameters with
        | None -> []
        | Some parameters ->
            Option.to_list @@
            typedecl_of_ty (Path.append path "parameters") parameters
      in
      let output =
        match output.schema with
        | None -> []
        | Some schema ->
            Option.to_list @@
            typedecl_of_ty (Path.append path "output") schema
      in
      parameters @ output
  | Subscription { parameters; message; _ } ->
      let parameters =
        Option.to_list @@
        typedecl_of_ty (Path.append path "parameters") parameters
      in
      let message =
        Option.to_list @@
        typedecl_of_ty (Path.append path "message") message
      in
      parameters @ message

(* *)

module TD = struct
  type t = typedecl
  let compare t1 t2 = compare t1.path t2.path
  let hash t = Hashtbl.hash t.path
  let equal t1 t2 = t1.path = t2.path
end

module G = Graph.Persistent.Digraph.Concrete(TD)

let build_graph typedecls =
  let find_typedecl path = List.find_opt (fun td -> td.path = path) typedecls in
  prerr_endline "graph...";
  let g =
    List.fold_left (fun g typedecl ->
        let g = G.add_vertex g typedecl in
        let deps =
          List.map (fun p ->
              match find_typedecl p with
              | Some td -> td
              | None ->
                  Format.eprintf "Error %a: %a no such path@.  @[%a@]@."
                    Path.pp typedecl.path
                    Path.pp p
                    (pp_as_json yojson_of_datatype) typedecl.datatype;
                  assert false
            ) typedecl.deps
        in
        List.fold_left (fun g dep -> G.add_edge g typedecl dep) g deps) G.empty typedecls
  in
  prerr_endline "graph done";
  let module SCC = Graph.Components.Make(G) in
  let sccs = SCC.scc_list g in
  prerr_endline "sccs done";
  List.iter (fun scc ->
      match scc with
      | [_] -> ()
      | _ ->
          Format.eprintf "Recursive %a@."
            (Format.pp_print_list
               ~pp_sep:(fun ppf () -> Format.pp_print_string ppf " ")
               (fun ppf typedecl -> Path.pp ppf typedecl.path))
            scc
    ) sccs;
  sccs
