{ pkgs, lib, ... }:
let
  inherit (pkgs) lib callPackage makeOverridable;

  buildZoteroXpiAddon = makeOverridable (
    { stdenv ? pkgs.stdenv
    , fetchurl ? pkgs.fetchurl
    , pname
    , version
    , addonId
    , url
    , hash
    , meta
    , ...
    }:
    stdenv.mkDerivation {
      name = "${pname}-${version}";

      inherit meta;

      src = fetchurl { inherit url hash; };

      preferLocalBuild = true;
      allowSubstitutes = true;

      buildCommand = ''
        dst="$out/share/zotero/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
        mkdir -p "$dst"
        install -v -m644 "$src" "$dst/${addonId}.xpi"
      '';
    }
  );

    zotero-open-pdf = buildZoteroXpiAddon rec {
      pname = "zotero-open-pdf";
      version = "0.0.11";
      addonId = "open-pdf@iris-advies.com";

      url = "https://github.com/retorquere/zotero-open-pdf/releases/download/v${version}/zotero-open-pdf-${version}.xpi";
      hash = "sha256-j6S7SQncj99+XrLN76EjnaEZqrjZZwOWjVtaDV1kKYI=";

      meta = with lib; {
        homepage = "https://github.com/retorquere/zotero-open-pdf";
        # license unclear
        platforms = platforms.all;
      };
    };
in
{


  home-manager.users.nartan.options.programs.zotero = {
    extensions = [
      zotero-open-pdf
    ];

    enable = true;
    settings = {
      "extensions.zotero.fileHandler.pdf" = pkgs.sioyek;
    };
  };
}
