{ ... }:

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
    inherit extraConfig extraLuaConfig;
};
}
  
