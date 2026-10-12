{
  pkgs,
  lib,
  config,
  ...
}:

{
  services.minecraft-server = {
    enable = true;
    eula = true;
    declarative = true;
    openFirewall = true;

    serverProperties = {
      gamemode = "survival";
      server-port = 25565;
      max-players = 2;
      white-list = true;
    };

    whitelist = {
      nartan_ = "2a87559d-0931-4d9c-b900-cbcef2082d85";
      Gruselmaus = "1c699d52-e5c1-4312-b033-6f81b90745db";
    };
  };
}
