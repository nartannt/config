{ pkgs, lib, ... }:

{
  home-manager.users.nartan.options.programs.zotero = {
    enable = true;
    #extraPackages = with pkgs; [
    #  sioyek
    #];

    settings = {
      "extensions.zotero.fileHandler.pdf" = pkgs.sioyek;
    };
  };
}
