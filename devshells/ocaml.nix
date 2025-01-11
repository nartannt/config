{ mkDevShell, pkgs }:

with pkgs;
with ocamlPackages;
mkDevShell pkgs "ocaml" [
  findlib
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
]


