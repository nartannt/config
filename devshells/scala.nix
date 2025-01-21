{ mkDevShell, pkgs }:

with pkgs;
mkDevShell pkgs "scala" [ metals sbt scala scalafmt ]
