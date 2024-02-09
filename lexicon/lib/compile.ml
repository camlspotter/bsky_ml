open Bsky_ml_base.Utils

let load_lexicons files =
  List.map (fun fn ->
      Format.eprintf "Loading %s@." fn;
      Result.get_ok @@ Types.load_lexicon fn) files

let defs_of_lexicon (lexicon : Types.lexicon) =
  let nsid = lexicon.id in
  List.map (fun (k,def) ->
      let open Types2 in
      let path = Path.{ nsid; names= [k] } in
      let defs = conv_def path def in
      path, defs) lexicon.defs

let typedecls_of_defs pdefs =
  List.concat_map (fun (path,defs) ->
      let open Types2 in
      List.concat_map (typedecls_of_def path) defs
    ) pdefs

let xrpcs_of_defs pdefs =
  List.concat_map (fun (path, defs) ->
      List.filter_map (fun def ->
          Convert.build_xrpc (path, def)) defs
    ) pdefs

let pp_typedefs ppf sccs =
  let open Types2 in
  Format.fprintf ppf "type unknown = Yojson.Safe.t@.@.";
  Format.fprintf ppf "type blob = bytes@.@.";
  Format.fprintf ppf "type cid_link = string@.@.";
  Format.fprintf ppf "type 'a nullable = 'a option@.@.";
  List.iter (fun typedecls ->
      let open Ppxlib in

      Format.fprintf ppf "(*@.";
      List.iter (fun typedecl ->
          Format.fprintf ppf "  @[%a@]@." pp_typedecl typedecl) typedecls;
      Format.fprintf ppf "*)@.";

      let signature =
        [ { psig_desc=
              Psig_type (Recursive,
                         List.map (fun typedecl ->
                             { typedecl.decl
                               with
                                 ptype_attributes =
                                   Option.to_list
                                     (Option.map (fun s ->
                                          Utils.comment s) typedecl.description)
                             })
                           typedecls);
            psig_loc= Location.none } ]
      in
      Format.fprintf ppf "%a@.@." Pprintast.signature signature ) sccs

let pp_converters ppf sccs =
  let open Format in
  pp_print_string ppf
{|
open Ppx_yojson_conv_lib.Yojson_conv

let fail_yojson tyname mes (j : Yojson.Safe.t) =
  raise (Ppx_yojson_conv_lib.Yojson_conv.Of_yojson_error
           (Invalid_argument (tyname ^ ": " ^ mes), j))

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

|};
  fprintf ppf "@.";
  let module Ast_builder = Ppxlib.Ast_builder.Make(struct let loc = Location.none end) in
  List.iter (fun scc ->

      let bindings =
        List.map (fun typedecl ->
            let fn, expr = Convert.build_of_yojson typedecl in
            Ast_builder.(value_binding
                           ~pat:(ppat_var (Located.mk fn))
                           ~expr)
          ) scc
      in
      let open Ppxlib.Asttypes in
      let items =
        match bindings with
        | [_] ->
            Ast_builder.pstr_value_list
              ~loc:Location.none
              Nonrecursive
              bindings
        | _ ->
            Ast_builder.pstr_value_list
              ~loc:Location.none
              Recursive
              bindings
      in
      List.iter (fun item ->
          Format.fprintf ppf "@[%a@]@.@."
            Ppxlib.Pprintast.structure_item item) items;

      let bindings =
        List.map (fun typedecl ->
            let pat, expr = Convert.build_yojson_of typedecl in
            Ast_builder.(value_binding ~pat ~expr)
          ) scc
      in
      let open Ppxlib.Asttypes in
      let items =
        match bindings with
        | [_] ->
            Ast_builder.pstr_value_list
              ~loc:Location.none
              Nonrecursive
              bindings
        | _ ->
            Ast_builder.pstr_value_list
              ~loc:Location.none
              Recursive
              bindings
      in
      List.iter (fun item ->
          Format.fprintf ppf "@[%a@]@.@."
            Ppxlib.Pprintast.structure_item item) items;
    ) sccs

let pp_xrpcs ppf xrpcs =
  let xrpcs = Tree.unflatten ~compare:String.compare xrpcs in
  let () = Format.fprintf ppf
      {|include Xrpc_base
open Bsky_ml_base.Types
open Lexicon

      |}
  in
  let rec visit tree =
    List.iter (function
        | Tree.Leaf a ->
            Format.fprintf ppf "%a@." Ppxlib.Pprintast.structure_item a
        | Branch (n, tree) ->
            Format.fprintf ppf "module %s = struct@." n;
            visit tree;
            Format.fprintf ppf "end@.";
      ) tree
  in
  visit xrpcs
