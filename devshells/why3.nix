{ mkDevShell, pkgs }:

with pkgs;
mkDevShell pkgs "why3" [
  why3
  cvc5
  cvc4
  coq_8_18
  coqPackages_8_18.coqide
  z3
  #alt-ergo
]


