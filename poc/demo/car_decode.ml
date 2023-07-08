open Blueskaml_base
open Blueskaml_poc
open Utils
open Car

let () =
  let blocks_bin = input_file "blocks.bin" in
  let len_blocks_bin = String.length blocks_bin in
  Format.eprintf "Len: %d@." len_blocks_bin;
  let (header, blocks), _ = Result.get_ok @@ decode (blocks_bin, 0) in
  Format.eprintf "Header: %a@." Cbor.pp header;
  List.iter (function
      | `Raw (cid, data) ->
          Format.eprintf "Block cid=%a data= (%d)@." Cid.pp cid (String.length data)
      | `Dag_cbor (cid, cbor) ->
          Format.eprintf "@[<2>Block cid=%a@ @[%a@]@]@."
            Cid.pp cid
            Cbor.pp cbor) blocks
