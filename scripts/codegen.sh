#!/bin/sh
set -e
(cd ../lexicon/compiler; dune exec ./compiler.exe)

ocamlformat ../src/lexicon.ml > ../src/lexicon.ml.tmp
mv ../src/lexicon.ml.tmp ../src/lexicon.ml

ocamlformat ../src/xrpc.ml > ../src/xrpc.ml.tmp
mv ../src/xrpc.ml.tmp ../src/xrpc.ml
