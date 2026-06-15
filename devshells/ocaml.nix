{ mkDevShell, pkgs }:

with pkgs;
with ocamlPackages;
mkDevShell pkgs "ocaml" [
  findlib
  fix
  dune_3
  ocaml
  ocaml-lsp
  ocamlformat
  ppx_inline_test
  utop
  containers
  containers-data
  iter
  menhirLib
  fileutils
  merlin
  menhir
  rustc
]
