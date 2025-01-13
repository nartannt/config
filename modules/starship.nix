{ ... }:

{
programs.starship = {
  enable = true;
  settings = {
    format = "[blabla]$all$shell$nix_shell$battery";
    character = {
      success_symbol = "[✓](bold green) ";
      error_symbol = "[✗](bold red) ";
      home_symbol = "~";
      truncation_symbol = "aaa";
      not_executable_symbol = "xxx";
      tag_symbol = "bbb";
      not_found_symbol = "ccc";
      signal_symbol = "ddd";
      expiration_symbol = "eee";
    };
    battery = {
      format = "[$percentage]($style) ";
      disabled = false;
      display = [
        {
          style = "red bold";
          threshold = 10;
        }
      ];
      charging_symbol = "gggg";
      discharging_symbol = "hhhh";
      empty_symbol = "qsdfsd";
      full_symbol = "jjjjj";
      unknown_symbol = "[a]";
    };
    nix_shell = {
      format = "[$symbol$state( ($name))]($style) ";
      disabled = false;
      impure_msg = "[impure](bold red)";
      pure_msg = "[pure](bold green)";
      style = "bold blue";
      symbol = "a";
    };
    shell = {
          format = "[$indicator]($style) ";
          bash_indicator = "bsh";
          cmd_indicator = "cmd";
          elvish_indicator = "esh";
          fish_indicator = "";
          ion_indicator = "ion";
          nu_indicator = "nu";
          powershell_indicator = "a";
          style = "white bold";
          tcsh_indicator = "tsh";
          unknown_indicator = "mystery shell";
          xonsh_indicator = "xsh";
          zsh_indicator = "zsh";
          disabled = false;
        };
  };
};
}
