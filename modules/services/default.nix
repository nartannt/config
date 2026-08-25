{
  inputs,
  lib,
  pkgs,
  ...
}:

{
  # Enable CUPS to print documents.
  services.printing.enable = true;

  networking.networkmanager = {
     enable = true;
     plugins = with pkgs; [
        networkmanager-openvpn
      ];
  };

  imports = [
    ./syncthing.nix
  ];

}
