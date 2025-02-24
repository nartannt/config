{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, ... }:
    let
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
      lib = nixpkgs.lib.extend (final: prev: {
        myLib = import ./lib {
          lib = final;
          inherit inputs;
        };
      });

    in {
      nixosConfigurations =
        lib.genAttrs [ "tulkas" "palacendo" ] lib.myLib.hostNixosConfig;
      devShells."x86_64-linux" = lib.myLib.mapModulesNoDefault ./devshells
        (p: pkgs.callPackage p { inherit (lib.myLib) mkDevShell; });

    };
}

