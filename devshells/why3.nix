{ mkDevShell, pkgs }:

with pkgs;
mkDevShell pkgs "why3" [
  why3
  cvc5
  cvc4
  alt-ergo
]


