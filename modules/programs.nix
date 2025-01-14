{ pkgs, ... }:

let
  my-python-packages = p: with p; [ pandas nltk numpy matplotlib ];
  python-with-my-packages = pkgs.python3.withPackages my-python-packages;

in {
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

  programs.bash = {
    shellAliases = {
      open = "xdg-open";
      cp = "cp -i";
      mv = "mv -i";
    };
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

    # TODO sort programs
    # email
    hydroxide
    # utils
    lshw
    #graphviz

    #programming
    coq
    coqPackages.autosubst
    coqPackages.equations
    # C
    gcc
    cmake
    clang-tools
    #libcxx
    #glibc.static
    # Rust
    rustc
    rustup
    rust-analyzer
    # OCaml
    ocaml
    ocamlPackages.lsp
    ocamlPackages.merlin

    nixfmt-classic

    # Python
    python-with-my-packages
    # general tools
    gnumake
    # media
    fragments
    # music
    beets
    polaris
    vlc
    ffmpeg
    picard
    # typesetting
    ghostscript
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

    alass
    zip
    zola
    unzip
    wget
    firefox-wayland
    vim
    neovim
    python310Packages.pynvim
    # shell
    gnomeExtensions.pano
    libgda
    gsound
    #gensio
    zoom-us
    tree
    steam
    flatpak
    rPackages.proton
    pkgs.gnome.gvfs
    htop
    file
    patchelf
    pdftk
    xournalpp
    planify
    geeqie
    magic-wormhole
    croc
    #minecraft
    zotero
    tagger
    # open source launcher for epic games games
    heroic-unwrapped
    wormhole-rs
    #audacity
    #shotcut
    #kdenlive
    #shotwell
    inkscape
    prismlauncher
    inetutils
    thunderbird
    evolution

    trilium-desktop
    # proton
    protonvpn-cli_2
    #gromacs
    wl-clipboard
    syncthing
    openvpn
    git
    gitlab-runner
    # security
    gnupg
    pass

    # communication
    element-desktop
    signal-desktop
    skypeforlinux

    # packages i need but don't really understand
    #nodejs less than 16 for copilot apparently
    libGL
    bc
    xorg.libX11
    binutils
    #binutilsNoLibc
    findutils
  ];
}
