{ pkgs, lib, config, ... }:
{

  services = {
    syncthing = {
      enable = false;
      user = "nartan";
      dataDir = "/home/nartan/Documents";
      configDir = "/home/nartan/.config/syncthing";
      overrideDevices = true; # overrides any devices added or deleted through the WebUI
      overrideFolders = true; # overrides any folders added or deleted through the WebUI
      settings = {
        devices = {
          "tulkas" = {
            id = "AGGXWHR-BREZAAW-KLD2FUJ-PGTCXDS-Q2DJJWO-JPT5KP2-ZSNJGPH-ILVIEQS";
          };
          "irmo" = {
            id = "MVPWKWU-2JUEF6P-LFJRUV6-WBA4SU7-UJ7SNMC-EMOWRQW-VFRSJ2O-JOI3MQM";
          };
          "garviel" = {
            id = "HB2LELB-WFTTKQ4-UEQTYQQ-XEWZMW5-T2DTVEE-TCC2JQE-YHUBIRS-GQC3CQY";
          };
          "palacendo" = {
            id = "FKT3GOB-VSJVWP2-6RJUAOP-O77UVWT-4VKVQ4E-PD6YEBY-NXYPM4K-WNW3CAZ";
          };
          # TODO "abaddon" = {id = ""};
        };
        folders = {
          #"zotero" = {};
          #"notes" =  {};
          "music" = {
            # Name of folder in Syncthing, also the folder ID
            path = "~/Music"; # Which folder to add to Syncthing
            devices = [ "tulkas" "palacendo" ]; # Which devices to share the folder with
          };
          "phone_photos" = {
            path = "~/Pictures/photos/phone_photos";
            devices = [
              "irmo"
              "tulkas"
              "palacendo"
            ];
          };
          "boox_notes" = {
            path = "~/Documents/etudes/boox_notes";
            devices = [
              "tulkas"
              "garviel"
              "palacendo"
            ];
          };
        };
      };
    };
  };
}
