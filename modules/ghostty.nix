{ pkgs, lib, config, ... }:
{

  home-manager.users.nartan.programs.ghostty = {

    enable = true;
    enableBashIntegration = true;

     settings = {
      cursor-style = "bar";
      gtk-titlebar = false;
      theme = "light:nord-light,dark:nord";
      window-inherit-working-directory = true;
      window-theme = "ghostty";
      mouse-hide-while-typing = true;
      font-features = ["-calt"];
      #calt = 0;

      #keybind = ctrl+plus=increase_font_size:1;
      #keybind = ctrl+minus=decrease_font_size:1;
      #keybind = ctrl+zero=reset_font_size;
      };

  };
}

