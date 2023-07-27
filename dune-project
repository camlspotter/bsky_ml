(lang dune 3.7)

(name bsky_ml)

(generate_opam_files true)

(source (github camlspotter/bsky_ml))

(authors "Jun FURUSE <jun.furuse@gmail.com>")

(maintainers "Jun FURUSE <jun.furuse@gmail.com>")

(license MIT)

; (documentation https://url/to/documentation)

(package
 (name bsky_ml)
 (synopsis "OCaml library to access BlueSky and the AT protocol")
 (description "OCaml wrapper for BlueSky and ATProto")
 (depends (ocaml (>= "4.14.0"))
 	   dune
	   lwt_ssl
	   cohttp-lwt-unix
	   websocket-lwt-unix
	   ptime
	   yojson
	   hex
	   multibase
	   cbor
	   ppx_yojson_conv)
; (tags (topics "to describe" your project))
 (version "1.0.0"))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
