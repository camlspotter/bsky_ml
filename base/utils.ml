let pp_as_json yojson_of ppf x =
  Yojson.Safe.pretty_print ?std:None ppf (yojson_of x)

let (^/) = Filename.concat

let catch f x = try Ok (f x) with e -> Error e

let of_yojson conv j =
  try Ok (conv j) with
  | Ppx_yojson_conv_lib.Yojson_conv.Of_yojson_error (exn, j') ->
      Format.eprintf "@[<2>Decode failure: %s@ @[%a@]@]@."
        (Printexc.to_string exn)
        (Yojson.Safe.pretty_print ~std:false) j';
      Error (`Decode_failure j)

let of_yojson_string conv s =
  match catch Yojson.Safe.from_string s with
  | Error _ -> Error (`Not_json s)
  | Ok j -> of_yojson conv j

let fail_yojson tyname mes (j : Yojson.Safe.t) =
  raise (Ppx_yojson_conv_lib.Yojson_conv.Of_yojson_error
           (Invalid_argument (tyname ^ ": " ^ mes), j))

type 'a jrecord = (string * 'a) list

let yojson_of_jrecord (a : 'a -> Yojson.Safe.t) kvs : Yojson.Safe.t =
  let rec loop acc seen = function
    | [] -> `Assoc (List.rev acc)
    | (k,v)::kvs ->
        if List.mem k seen then invalid_arg "yojson_of_record: dup key";
        loop ((k, a v) :: acc) (k::seen) kvs
  in
  loop [] [] kvs

let jrecord_of_yojson a = function
  | `Assoc kvs -> List.map (fun (k,v) -> (k, a v)) kvs
  | j -> fail_yojson "record" "Assoc expected" j

let input_file fn =
  let ic = open_in_bin fn in
  let buf = Buffer.create 1024 in
  let bytes = Bytes.create 1024 in
  let rec loop () =
    let nread = input ic bytes 0 1024 in
    if nread = 0 then (
      close_in ic;
      Buffer.contents buf
    ) else (
      Buffer.add_subbytes buf bytes 0 nread;
      loop ()
    )
  in
  loop ()

module List = struct
  include List

  (* Not TR *)
  let rec take n xs =
    match xs with
    | _ when n = 0 -> []
    | [] -> []
    | x::xs -> x :: take (n-1) xs
end
