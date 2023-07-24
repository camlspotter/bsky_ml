include CBOR
include Simple

let pp ppf x =
  let open Format in
  let f = fprintf in
  let rec pp ppf = function
    | `Array ts ->
        f ppf "[ %a ]"
          (Format.pp_print_list
             ~pp_sep:(fun ppf () -> f ppf ", ")
             pp) ts
    | `Text s -> f ppf "%S" s
    | `Map kvs ->
        (* Keys are only strings *)
        f ppf "{ %a }"
          (Format.pp_print_list
             ~pp_sep:(fun ppf () -> f ppf ", ")
             (fun ppf -> function
                | (k,v) ->
                    f ppf "%a : %a"
                      pp k pp v)) kvs
    | `Null -> f ppf "<null>"
    | `Undefined -> f ppf "<undefined>"
    | `Simple i -> f ppf "simple %d" i
    | `Bool b -> f ppf "%b" b
    | `Int i -> f ppf "%d" i
    | `Float n -> f ppf "%f" n
    | `Bytes s -> f ppf "<binary %d>" (String.length s)
    | `Tag (tag, t) -> f ppf "%d:%a" tag pp t
  in
  pp ppf x
