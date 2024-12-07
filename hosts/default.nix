{
  inputs,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./users.nix
    ./locale.nix
    ./programs.nix
  ];

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };

    package = pkgs.nixVersions.latest;
  };

  boot.tmp = {
    useTmpfs = true;
    cleanOnBoot = true;
  };
}
