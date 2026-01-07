{ config, pkgs, ... }:

{
  home-manager.users.nartan.programs.beets = {
     enable = true;
     #settings = builtins.readFile ./settings.yaml;
     settings = 
#plugins: discogs #
     {plugins = ["discogs" "chroma" "fetchart" "embedart" "parentwork" "scrub" "duplicates" "missing"];
  };
   };
}
