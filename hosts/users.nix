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
        extraGroup = [ "wheel" ];

        home = "/home/nartan";
        homeMode = "711";

        hashedPassowrd = "$y$j9T$jojdx8ojAWN/lZ4qeqzP4/$M9WCaPwBTP5koM7vLQ1eSiM.BKBohqzK5t90p74EYf5";
      };
    };
  };
}
