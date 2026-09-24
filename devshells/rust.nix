{ mkDevShell, pkgs }:

with pkgs;

mkDevShell pkgs "rust" [
  cargo
  perf
  clippy
  rust-analyzer
  rustPackages.clippy
  rustc
  rustfmt
]
