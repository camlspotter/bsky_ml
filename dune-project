(lang dune 3.7)

(name blueskaml)

(generate_opam_files true)

(source
 (github camlspotter/bluesky))

(authors "Jun FURUSE <jun.furuse@gmail.com>")

(maintainers "Jun FURUSE <jun.furuse@gmail.com>")

(license MIT)

; (documentation https://url/to/documentation)

(package
 (name blueskaml)
 (synopsis "OCaml library to access BlueSky")
 (description "OCaml wrapper for BlueSky")
 (depends (ocaml (>= "4.14.0"))
 	   dune
	   lwt_ssl
	   cohttp-lwt-unix
	   ptime
	   yojson
	   ppx_yojson_conv)
; (tags (topics "to describe" your project))
 (version "1.0.0"))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
