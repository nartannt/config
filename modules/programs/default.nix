{ pkgs, ... }:

let

in {

  imports = [ ./programming.nix ];

  services.openssh.enable = true;


  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    enableExtraSocket = true;
  };

  home-manager.users.nartan.programs.bash = {
    enable = true;
    shellAliases = {
      open = "xdg-open";
      cp = "cp -i";
      mv = "mv -i";
    };
  };

  nixpkgs.config.permittedInsecurePackages = [ "libsoup-2.74.3" ];

  home-manager.users.nartan.programs.git = {
    enable = true;
    lfs.enable = true;
    settings.user.name = "nartan";
    settings.user.email = "bozec.tanguy@gmail.com";
    # TODO defaultBranch = "main";
  };

  environment.systemPackages = with pkgs; [
    bat
    file
    git
    htop
    inetutils
    killall
    fd
    ncdu
    tree

    virtiofsd

    unzip
    zip
    wget
    findutils
    patchelf
    lshw

    pulseaudio

    # TODO sort programs
    # email
    # utils
    #graphviz
    ferdium

    #programming
    nixfmt
    nix-prefetch
    nix-prefetch-github

    # Python
    # general tools
    # media
    fragments
    # music
    nicotine-plus
    polaris
    vlc
    ffmpeg
    picard
    # typesetting
    #texlive.combined.scheme-full
    texlivePackages.tikz-cd
    texliveSmall
    texlab
    typst
    pandoc
    # general utilities
    #nodejs

    # for gaming purposes
    steam
    flatpak

    zola
    wget
    firefox

    vim
    neovim
    lua
    #python310Packages.pynvim

    # shell
    gnomeExtensions.pano
    gnomeExtensions.paperwm
    gnomeExtensions.lock-keys
    gsound
    #gensio
    zoom-us
    broot

    rPackages.proton
    protonmail-bridge
    protonmail-bridge-gui
    #hydroxide

    #tt-rss

    pdftk
    ghostscript
    xournalpp

    planify

    evince

    fzf

    geeqie

    magic-wormhole
    wormhole-rs
    croc
    #minecraft
    zola
    zotero
    tagger

    inkscape
    prismlauncher

    thunderbird

    trilium-desktop
    # proton
    proton-vpn
    #gromacs
    wl-clipboard

    ghostty

    gnomeExtensions.timer

    syncthing

    direnv
    nix-direnv

    openvpn
    gitlab-runner
    # security
    gnupg
    pass

    # communication
    element-desktop
    signal-desktop

    # packages i need but don't really understand
    #nodejs less than 16 for copilot apparently
    libGL
    #binutilsNoLibc
  ];
}
