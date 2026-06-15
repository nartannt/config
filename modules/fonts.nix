{ pkgs, ... }:

let 

in {
      fonts.packages = with pkgs; [
        fira
        fira-sans
        spleen
        linux-libertine-g
      ];
}
