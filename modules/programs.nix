{ pkgs, ... }:

  let
            my-python-packages = p: with p; [
                pandas
                nltk
                numpy
                matplotlib
              ];
            python-with-my-packages = pkgs.python3.withPackages my-python-packages;
          in
{
  services.openssh.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    enableExtraSocket = true;
  };

  programs.bash.shellAliases = {
    vim = "nvim";
    open = "xdg-open";
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

        # programming
        # general
        #linuxKernel.packages.linux_zen.perf
        #flamegraph
        #Prolog
        #swiProlog
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
        ocaml # opam
        ocamlPackages.lsp
        ocamlPackages.merlin
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
        starship
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
