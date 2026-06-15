{ inputs, lib, ... }:
{
 hostNixosConfig = hostname : lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      inputs.home-manager.nixosModules.home-manager

      ../modules
      ../hosts/${hostname}
      { networking.hostName = hostname; }
    ];

    specialArgs = {
      inherit inputs;
    };
};
}
