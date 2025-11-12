{ lib, ... }:

{
  time.timeZone = lib.mkDefault "Europe/Paris";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "fr";
  };
}
