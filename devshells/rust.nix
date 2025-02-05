{ mkDevShell, pkgs }:

with pkgs;

mkDevShell pkgs "rust" [
  cargo
  rust-analyzer
  rustPackages.clippy
  rustc
  rustfmt
]
