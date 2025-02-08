{ pkgs, ... }:

{
  users = {
    mutableUsers = false;

    users = {
      root = {
        hashedPassword = "*";
      };

      nartan = {
        isNormalUser = true;
        extraGroups = [ "wheel" "openrazer" ];

        home = "/home/nartan";
        homeMode = "711";

        hashedPassword = "$y$j9T$jojdx8ojAWN/lZ4qeqzP4/$M9WCaPwBTP5koM7vLQ1eSiM.BKBohqzK5t90p74EYf5";
      };
    };
  };
}
