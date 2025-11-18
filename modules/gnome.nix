{ pkgs, ... }:

{

  home-manager.users.nartan.xdg.mimeApps = {

    enable = true;
    defaultApplications = {
    "application/pdf" = ["sioyek.desktop" "gnome.evinnce.desktop" "firefox.desktop"];

    # calendar
    "text/calendar" = ["thunderbird.desktop"];
    "application/vnd.sus-calendar" = ["thunderbird.desktop"];
    "text/x-vcalendar" = ["thunderbird.desktop"];

    # email
    "message/rfc822" = ["thunderbird.desktop"];
    "application/mbox" = ["thunderbird.desktop"];
    "application/vnd.sema" = ["thunderbird.desktop"];
    "application/vnd.semd" = ["thunderbird.desktop"];
    "application/vnd.semf" = ["thunderbird.desktop"];
    "application/vnd.seemail" = ["thunderbird.desktop"];
    "x-scheme-handler/mailto" = ["thunderbird.desktop"];

    # images
    "image/jpeg" = ["org.gnome.Loupe.desktop"];
    "image/png" = ["org.gnome.Loupe.desktop"];
    "image/gif" = ["org.gnome.Loupe.desktop"];
    "image/webp" = ["org.gnome.Loupe.desktop"];
    "image/tiff" = ["org.gnome.Loupe.desktop"];
    "image/x-tga" = ["org.gnome.Loupe.desktop"];
    "image/vnd-ms.dds" = ["org.gnome.Loupe.desktop"];
    "image/x-dds" = ["org.gnome.Loupe.desktop"];
    "image/bmp" = ["org.gnome.Loupe.desktop"];
    "image/vnd.microsoft.icon" = ["org.gnome.Loupe.desktop"];
    "image/vnd.radiance" = ["org.gnome.Loupe.desktop"];
    "image/x-exr" = ["org.gnome.Loupe.desktop"];
    "image/x-portable-bitmap" = ["org.gnome.Loupe.desktop"];
    "image/x-portable-graymap" = ["org.gnome.Loupe.desktop"];
    "image/x-portable-pixmap" = ["org.gnome.Loupe.desktop"];
    "image/x-portable-anymap" = ["org.gnome.Loupe.desktop"];
    "image/x-qoi" = ["org.gnome.Loupe.desktop"];
    "image/qoi" = ["org.gnome.Loupe.desktop"];
    "image/svg+xml" = ["org.gnome.Loupe.desktop"];
    "image/svg+xml-compressed" = ["org.gnome.Loupe.desktop"];
    "image/avif" = ["org.gnome.Loupe.desktop"];
    "image/heic" = ["org.gnome.Loupe.desktop"];
    "image/jxl" = ["org.gnome.Loupe.desktop"];

    };
  };

  # these are stolen from https://heywoodlh.io/nixos-gnome-settings-and-keyboard-shortcuts


  home-manager.users.nartan.dconf.settings = {

    #"org/gnome/desktop/default-applications/office" = {
    #  calendar = "thunderbird";
    #};

    "org/gnome/shell" = {
       favorite-apps = [
          "firefox.desktop"
          "org.gnome.Nautilus.desktop"
         ];

        disable-user-extensions = false;
        disabled-extensions = "disabled";
        enabled-extensions = with pkgs.gnomeExtensions; [
          pano.extensionUuid
          lock-keys.extensionUuid
          paperwm.extensionUuid
        ];
    };

    "org/gnome/shell/extensions/paperwm" = {
      animation-time = 0.10;
      default-focus-mode = 0;
      disable-topbar-styling = true;
      show-focus-mode-icon = false;
      show-window-position-bar = false;
      show-workspace-indicator = false;
      show-open-position-icon = false;
      gesture-enabled = false;
      horizontal-margin = 5;
      selection-border-size = 2;
      vertical-margin = 5;
      vertical-margin-bottom = 5;
      window-gap = 7;
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
