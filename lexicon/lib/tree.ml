type ('k,'v) tree = ('k,'v) node list

and ('k,'v) node =
  | Leaf of 'v
  | Branch of 'k * ('k, 'v) tree

let rec unflatten ~compare (ksvs : ('k list * 'v) list) : ('k, 'v) tree =
  let leaves =
    List.filter_map (function
        | ([], v) -> Some (Leaf v)
        | _ -> None) ksvs
  in
  let branch_names =
    List.sort_uniq compare @@
    List.filter_map (function
        | (k::_, _) -> Some k
        | _ -> None) ksvs
  in
  let branches =
    List.map (fun branch_name ->
        let ksvs' =
          List.filter_map (function
              | (k::ks, v) when k = branch_name -> Some (ks, v)
              | _ -> None) ksvs
        in
        Branch (branch_name, unflatten ~compare ksvs')
      ) branch_names
  in
  leaves @ branches
