open Multibase

let () =
  (* base16 F *)
  let enc1, s1 = Result.get_ok @@ decode "BJV2WY5DJMJQXGZJANFZSAYLXMVZW63LFEEQFY3ZP" in
  assert (enc1 = `Base32upper);
  let enc2, s2 = Result.get_ok @@ decode "zYAjKoNbau5KiqmHPmSxYCvn66dA1vLmwbt" in
  assert (enc2 = `Base58btc);
  assert (s1 = s2)

(*
BJV2WY5DJMJQXGZJANFZSAYLXMVZW63LFEEQFY3ZP           # base32 B
K3IY8QKL64VUGCX009XWUHKF6GBBTS3TVRXFRA5R            # base36 K
zYAjKoNbau5KiqmHPmSxYCvn66dA1vLmwbt                 # base58 z
MTXVsdGliYXNlIGlzIGF3ZXNvbWUhIFxvLw==               # base64 M
*)
