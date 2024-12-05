{
  inputs,
  lib,
  pkgs,
  ...
}:

{
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };

    package = pkgs.nixVersion.latest;
  };

  boot.tmp = {
    useTmpfs = true;
    cleanOnBoot = true;
  };
}
