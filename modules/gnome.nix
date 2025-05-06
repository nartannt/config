{ pkgs, ... }:

{

  # these are stolen from https://heywoodlh.io/nixos-gnome-settings-and-keyboard-shortcuts 
  home-manager.users.nartan.dconf.settings = {

    "org/gnome/shell" = {
        disable-user-extensions = false;
        disabled-extensions = "disabled";
        enabled-extensions = with pkgs.gnomeExtensions; [
          pano.extensionUuid
          lock-keys.extensionUuid
        ];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" =
      {
        name = "open terminal ctrl-alt-t";
        command = "ghostty";
        binding = "<Ctrl><Alt>t";
      };

  };
}
