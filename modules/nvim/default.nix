{ pkgs, ... }:

let 
  extraConfig = builtins.readFile ./init.vim;
  extraLuaConfig = builtins.readFile ./config.lua;
in
{
home-manager.users.nartan.programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      nixfmt-classic
      tinymist
    ];


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
    ];

    inherit extraConfig extraLuaConfig;

    #plugins = [
    #  pkgs.vimPlugins.onenord-nvim
    #  pkgs.vimPlugins.vimtex
    #  pkgs.vimPlugins.Coqtail
    #  #pkgs.vimPlugins.texlab
    #  pkgs.vimPlugins.vim-ocaml
    #  #pkgs.vimPlugins.merlin
    #  pkgs.vimPlugins.conform-nvim
    #  pkgs.vimPlugins.nabla-nvim
    #  pkgs.vimPlugins.vim-fugitive
    #  pkgs.vimPlugins.vim-nix
    #  pkgs.vimPlugins.typst-vim
    #  pkgs.vimPlugins.vim-polyglot
    #  pkgs.vimPlugins.vim-hybrid-material
    #  pkgs.vimPlugins.rust-tools-nvim
    #  pkgs.vimPlugins.nvim-cmp
    #  pkgs.vimPlugins.nvim-snippy
    #  pkgs.vimPlugins.cmp-snippy
    #  pkgs.vimPlugins.nvim-lspconfig
    #  pkgs.vimPlugins.lsp-colors-nvim
    #  
    ##Plug 'lervag/vimtex'
    ##Plug 'whonore/Coqtail'
    ##Plug 'chrisbra/csv.vim'
    ##Plug 'latex-lsp/texlab'
    ##Plug 'ocaml/vim-ocaml'
    ##Plug 'ocaml/merlin'
    ##Plug 'stevearc/conform.nvim'
    ##Plug 'jbyuki/nabla.nvim'
    ##Plug 'tpope/vim-fugitive'
    ##Plug 'LnL7/vim-nix'
    ##Plug 'kaarmu/typst.vim'
    ##Plug 'sheerun/vim-polyglot'
    ##Plug 'kristijanhusak/vim-hybrid-material'
    ##Plug 'simrat39/rust-tools.nvim'
    ##Plug 'hrsh7th/nvim-cmp'
    ##Plug 'dcampos/nvim-snippy'
    ##Plug 'dcampos/cmp-snippy'
    ##Plug 'neovim/nvim-lspconfig'
    ##Plug 'folke/lsp-colors.nvim'
    #];

};
}
  
