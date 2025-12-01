{ inputs, lib, pkgs, ... }:

{
  imports = [
    ./users.nix
    ./ghostty.nix
    ./locale.nix
    ./starship.nix
    ./zotero.nix
    ./sioyek.nix
    ./nvim/default.nix
    ./programs/default.nix
    ./gnome.nix
    ./firefox.nix
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
