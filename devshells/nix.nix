{ mkDevShell, pkgs }:

with pkgs;
mkDevShell pkgs "nix" [
  nil
  nixfmt-rfc-style
]
