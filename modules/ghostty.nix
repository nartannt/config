{ pkgs, lib, config, ... }:
{

  home-manager.users.nartan.programs.ghostty = {

    enable = true;
    enableBashIntegration = true;

    settings = {

      cursor-style = "bar";
      gtk-titlebar = false;
      theme = "light:Nord Light,dark:Nord";

      window-decoration = "none";

      window-inherit-working-directory = false;
      window-theme = "ghostty";
      # TODO set up some nice cool thing where this number is calculated from the paperwm default smallest (or medium) cycle-width-steps width setting
      window-width = "68";
      window-height = "52";

      mouse-hide-while-typing = true;
      font-feature = [ "-calt" ];

      #calt = 0;

      #keybind = ctrl+plus=increase_font_size:1;
      #keybind = ctrl+minus=decrease_font_size:1;
      #keybind = ctrl+zero=reset_font_size;
    };

  };
}
