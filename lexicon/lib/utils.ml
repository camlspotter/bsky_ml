let loc_none = Location.none

let with_loc txt =
  let open Ppxlib.Asttypes in
  {txt; loc= loc_none}

let comment s =
  let open Ppxlib.Parsetree in
  { attr_name = with_loc "ocaml.doc";
    attr_payload =
      PStr [ { pstr_desc=
                 Pstr_eval ({ pexp_desc=
                                Pexp_constant (Pconst_string (s, loc_none, None));
                              pexp_loc= loc_none;
                              pexp_loc_stack= [];
                              pexp_attributes= [] },
                            []);
               pstr_loc= loc_none } ];
    attr_loc= loc_none }
