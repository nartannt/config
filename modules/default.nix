{ inputs, lib, pkgs, ... }:

{
  imports = [
    ./users.nix
    ./locale.nix
    ./starship.nix
    ./nvim/default.nix
    ./programs/default.nix
  ];

  nix = {
    registry.conf.flake = inputs.self;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };

    package = pkgs.nixVersions.latest;
  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  boot.tmp = {
    useTmpfs = true;
    cleanOnBoot = true;
  };
}
