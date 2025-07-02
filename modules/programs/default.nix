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


  home-manager.users.nartan.programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "nartan";
    userEmail = "bozec.tanguy@gmail.com";
    # TODO defaultBranch = "main";
  };

  environment.systemPackages = with pkgs; [
    bat
    file
    git
    htop
    inetutils
    killall
    ncdu
    tree
    unzip
    zip
    wget
    tree
    findutils
    patchelf
    lshw

    # TODO sort programs
    # email
    # utils
    #graphviz

    #programming
    nixfmt-classic
    nix-prefetch
    nix-prefetch-github

    # Python
    # general tools
    # media
    fragments
    # music
    beets
    polaris
    vlc
    ffmpeg
    picard
    # typesetting
    #ghostscript
    texlive.combined.scheme-full
    texlivePackages.tikz-cd
    texliveFull
    texlab
    typst
    # general utilities
    #nodejs

    # for gaming purposes
    lutris
    wine
    wine-staging
    steam
    flatpak

    zola
    wget
    firefox-wayland

    vim
    neovim
    lua
    python310Packages.pynvim

    # shell
    gnomeExtensions.pano
    gnomeExtensions.paperwm
    gnomeExtensions.lock-keys
    libgda5
    gsound
    #gensio
    zoom-us

    rPackages.proton
    #hydroxide

    pkgs.gnome.gvfs

    pdftk
    xournalpp

    planify

    geeqie

    magic-wormhole
    wormhole-rs
    croc
    #minecraft
    zotero
    tagger

    inkscape
    prismlauncher

    thunderbird

    trilium-desktop
    # proton
    protonvpn-gui
    #gromacs
    wl-clipboard

    ghostty

    gnomeExtensions.timer

    syncthing

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
