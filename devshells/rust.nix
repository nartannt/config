{ mkDevShell, pkgs }:

with pkgs;

mkDevShell pkgs "rust" [
  cargo
  perf
  rust-analyzer
  rustPackages.clippy
  rustc
  rustfmt
]
