{ mkDevShell, pkgs }:

with pkgs;

mkDevShell pkgs "lean" [
   lean4
   elan
]
