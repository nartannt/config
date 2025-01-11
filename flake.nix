{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "nixos-hardware";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixos-hardware,
      flake-parts,
      home-manager,
    }:
    let
      lib = nixpkgs.lib.extend (
        final: prev: {
          incense = import ./lib {
            lib = final;
            inherit inputs;
          };
        }
      );
    in



    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
      ];

      flake = {
        nixosConfigurations = {
          tulkas = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
              ./hosts
              ./hosts/tulkas

              home-manager.nixosModules.home-manager
              ( {nix.registry.conf.flake = self; })
            ];

            specialArgs = {
              inherit inputs;
            };
          };
        
        };
        
      };


      perSystem =
        {
          config,
          pkgs,
          system,
          ...
        }:
        {
          devShells = lib.incense.mapModulesNoDefault ./devshells (
            p: pkgs.callPackage p { inherit (lib.incense) mkDevShell; }
          );
        };
    };

}
    
