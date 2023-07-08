type ('k,'v) tree = ('k,'v) node list

and ('k,'v) node =
  | Leaf of 'v
  | Branch of 'k * ('k, 'v) tree

(** Recover a tree from the flattened list *)
val unflatten :
  compare:('k -> 'k -> int) -> ('k list * 'v) list -> ('k, 'v) tree
