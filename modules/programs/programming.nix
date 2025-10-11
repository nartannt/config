{ pkgs, ... }:

let
  c_packages = with pkgs; [ gcc cmake clang-tools ];
  ocaml_packages = with pkgs; [ ocaml ocamlPackages.lsp ocamlPackages.merlin ];
  coq_packages = with pkgs; [ coq coqPackages.autosubst coqPackages.equations ];
  rust_packages = with pkgs; [ rustc rustup rust-analyzer ];
  scala_packages = with pkgs; [ metals sbt scala scalafmt ];

  git_packages = with pkgs; [git git-lfs];

  my-python-packages = p: with p; [pyyaml numpy matplotlib /*pandas nltk*/ ];
  python-with-my-packages = pkgs.python3.withPackages my-python-packages;

  #_packages = with pkgs; [ ];

in {
  environment.systemPackages = with pkgs;
    ocaml_packages ++ c_packages ++ coq_packages ++ rust_packages
    ++ scala_packages ++ git_packages ++ [ python-with-my-packages binutils gnumake ];
}
