{ config, pkgs, ... }:

{
  programs = {
    firefox = {
      enable = true;
      package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
        extraPolicies = {
          DisableTelemetry = true;
          EnableTrackingProtection = {
            Value = true;
            Locked = true;
            Cryptomining = true;
            Fingerprinting = true;
          };
          DisablePocket = true;
          DisableFirefoxAccounts = true;
          DisableAccounts = true;
          DisableFirefoxScreenshots = true;
          OverrideFirstRunPage = "";
          OverridePostUpdatePage = "";
          DontCheckDefaultBrowser = true;
          DisplayBookmarksToolbar = "newtab";
          DisplayMenuBar = "default-on"; # alternatives: "always", "never" or "default-on"
          #SearchBar = "unified"; # alternative: "separate"
          # add policies here...

          # ---- EXTENSIONS ----
          ExtensionSettings = {
            #"*".installation_mode = "blocked"; # blocks all addons except the ones specified below
            # uBlock Origin:
            "uBlock0@raymondhill.net" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
              installation_mode = "force_installed";
            };

            # I still don't care about cookies:
            "idcac-pub@guus.ninja" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/istilldontcareaboutcookies/latest.xpi/";
              installation_mode = "force_installed";
            };

            # Zotero Connector
            # TODO make this updatable instead of from a specific version
            "zotero@chnm.gmu.edu" = {
              install_url = "https://www.zotero.org/download/connector/dl?browser=firefox&version=5.0.189";
              installation_mode = "force_installed";
            };

            # Simple Translate
            "simple-translate@sienori" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/simple_translate/latest.xpi/";
              installation_mode = "force_installed";
            };

            # Video DownloadeHelper
            "{b9db16a4-6edc-47ec-a1f4-b86292ed211d}" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/video_downloadhelper/latest.xpi/";
              installation_mode = "force_installed";
            };
            # add extensions here...
          };

          # ---- PREFERENCES ----
          # Set preferences shared by all profiles.
          Preferences = {
            # add global preferences here...
          };
        };
      };

      # ---- PROFILES ----
      # Switch profiles via about:profiles page.
      # For options that are available in Home-Manager see
      # https://nix-community.github.io/home-manager/options.html#opt-programs.firefox.profiles
    };
  };
}
