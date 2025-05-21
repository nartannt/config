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
          paperwm.extensionUuid
        ];
    };
  "org/gnome/shell/extensions/paperwm" = {
    #animation-time = 0.10;
    default-focus-mode = 0;
    disable-topbar-styling = true;
    #gesture-enabled = false;
    #horizontal-margin = 5;
    #selection-border-size = 2;
    #vertical-margin = 5;
    #vertical-margin-bottom = 5;
    #window-gap = 7;
    #show-focus-mode-icon = false;
    #show-open-position-icon = false;
    #show-window-position-bar = false;
    #show-workspace-indicator = false;
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
