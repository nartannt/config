{ lib, inputs, ... }:

let
  inherit (lib) makeExtensible attrValues foldr;
  inherit (modules) mapModules;

  modules = import ./modules.nix {
    inherit lib;
    self.attrs = import ./attrs.nix {
      inherit lib;
      self = { };
    };
  };

  skavenLib = makeExtensible (self: mapModules ./. (file: import file { inherit self lib inputs; }));
in
skavenLib.extend (self: super: foldr (a: b: a // b) { } (attrValues super))
