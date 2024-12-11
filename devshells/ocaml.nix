{ mkDevShell, pkgs }:

with pkgs;
with ocamlPackages;
mkDevShell pkgs "OCaml" [
  findlib
  dune_3
  ocaml
  ocaml-lsp
  ocamlformat
  utop
  containers
  containers-data
  iter
  menhirLib
  fileutils
]


