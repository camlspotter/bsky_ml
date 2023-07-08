type t =
  { identifier : string;
    password : string;
  } [@@deriving yojson]

(* Plain text in file.  Insecure *)
val load : string -> (t, [> `Exn of exn]) result
