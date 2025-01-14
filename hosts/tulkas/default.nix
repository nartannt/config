# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-bb52ebe0-a875-4a78-831d-1d2cead2faa6".device = "/dev/disk/by-uuid/bb52ebe0-a875-4a78-831d-1d2cead2faa6";
  boot.initrd.luks.devices."luks-bb52ebe0-a875-4a78-831d-1d2cead2faa6".keyFile = "/crypto_keyfile.bin";

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # For updating drivers
  services.fwupd.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  hardware.enableAllFirmware = true;
  # Enable sound with pipewire.
  #sound.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    powerManagement.enable = true;
    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of
    # supported GPUs is at:
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    # Only available from driver 515.43.04+
    # Do not disable this unless your GPU is unsupported or if you have a good reason to.
    open = true;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.nvidia.prime = {
    sync.enable = true;
    # Make sure to use the correct Bus ID values for your system!
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:2:0:0";
  };

  fonts.packages = with pkgs; [
    fira
    spleen
  ];

    # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    gcc
    pkg-config
    fontconfig
  ];

  services.flatpak.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  services = {
    syncthing = {
      enable = true;
      user = "nartan";
      dataDir = "/home/nartan/Documents";
      configDir = "/home/nartan/.config/syncthing";
      overrideDevices = true; # overrides any devices added or deleted through the WebUI
      overrideFolders = true; # overrides any folders added or deleted through the WebUI
      settings = {
        devices = {
          "tulkas" = {
            id = "27A5EQP-JE4BTBA-T5NM5UW-RJF3KP5-HENGUIU-MYDWHYO-5XJGZOF-3I4MSA4";
          };
          "irmo" = {
            id = "MVPWKWU-2JUEF6P-LFJRUV6-WBA4SU7-UJ7SNMC-EMOWRQW-VFRSJ2O-JOI3MQM";
          };
          "garviel" = {
            id = "HB2LELB-WFTTKQ4-UEQTYQQ-XEWZMW5-T2DTVEE-TCC2JQE-YHUBIRS-GQC3CQY";
          };
        };
        folders = {
          "music" = {
            # Name of folder in Syncthing, also the folder ID
            path = "~/Music"; # Which folder to add to Syncthing
            devices = [ "tulkas" ]; # Which devices to share the folder with
          };
          "phone_photos" = {
            path = "~/Pictures/photos/phone_photos";
            devices = [
              "irmo"
              "tulkas"
            ];
          };
          "boox_notes" = {
            path = "~/Documents/etudes/boox_notes";
            devices = [
              "tulkas"
              "garviel"
            ];
          };
        };
      };
    };
  };

  system.stateVersion = "22.05"; # Did you read the comment?
  home-manager.users.nartan.home.stateVersion = "24.11";

}
