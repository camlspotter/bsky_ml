(* https://en.wikipedia.org/wiki/LEB128 *)

(* Unsigned, ULEB128 *)

module Unsigned = struct
  let encode i =
    let buf = Buffer.create 8 in
    let rec loop i =
      let r = i land 127 in
      match i lsr 7 with
      | 0 ->
          Buffer.add_char buf (Char.chr r);
          Buffer.contents buf
      | i ->
          Buffer.add_char buf (Char.chr (r + 128));
          loop i
    in
    loop i

  let decode : int ParserM.t = fun (s, pos) ->
    let slen = String.length s in
    let rec loop acc pos bits =
      if slen <= pos then Error ("ULEB128.decode overrun", (s, pos))
      else
        let c = Char.code s.[pos] in
        if c land 128 <> 0 then
          loop ((c land 127) lsl bits + acc) (pos + 1) (bits + 7)
        else Ok (c lsl bits + acc, (s, pos + 1))
    in
    loop 0 pos 0
end
