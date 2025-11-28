{ pkgs, lib, ... }:

let
  extraConfig = builtins.readFile ./init.vim;
  extraLuaConfig = builtins.readFile ./config.lua;
  fromGitHub = { repo, rev, sha256 }:
    let
      parts = builtins.filter (val: val != [ ]) (builtins.split "/" repo);
      owner = builtins.elemAt parts 0;
      name = builtins.elemAt parts 1;

      src = pkgs.fetchFromGitHub {
        inherit owner rev sha256;
        repo = name;
      };

    in pkgs.vimUtils.buildVimPlugin {
      inherit src;
      pname = lib.strings.sanitizeDerivationName repo;
      version = rev;
    };
in {
  home-manager.users.nartan.programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    defaultEditor = true;
    extraPackages = with pkgs; [ nixfmt-classic tinymist ];

    ##stolen from https://github.com/junegunn/vim-plug/issues/1010
    #start = [
    #      # vim-plug # <--- Does not work as-is, so the below override is required.
    #      (vim-plug.overrideAttrs (old: {
    #        postInstall = ''
    #          mkdir -pv $target/autoload
    #          ln -s $target/plug.vim $target/autoload
    #        '';
    #      }))
    #    ];
    #  };

    plugins = with pkgs.vimPlugins; [
      Coqtail
      vimtex
      csv-vim
      vim-ocaml
      #ocaml.nvim
      conform-nvim
      nabla-nvim
      vim-fugitive
      vim-nix
      typst-vim
      vim-polyglot
      vim-hybrid-material
      nvim-cmp
      nvim-snippy
      cmp-snippy
      nvim-lspconfig
      lsp-colors-nvim
      tabular
      vim-markdown
      onenord-nvim
      (fromGitHub {
        repo = "Myriad-Dreamin/tinymist";
        rev = "a42700c04bb0e780fb7c44eabce84834b767948f";
        sha256 = "sha256-U+TwHCncC4Umjl4Ko7jC7zT0rJhcmWLpW+oC6eKEHz8=";
      })
      #rust-tools-nvim
      #texlab
      #merlin
    ];

    #Plug 'jalvesaq/zotcite'
    # dependencies of zotcite
    #Plug 'nvim-telescope/telescope.nvim'
    #Plug 'nvim-treesitter/nvim-treesitter', { 'branch': 'main' }
    #Plug 'jalvesaq/cmp-zotcite'

    inherit extraConfig extraLuaConfig;

  };
}

