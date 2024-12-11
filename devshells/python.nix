{ mkDevShell, pkgs }:

with pkgs;
mkDevShell pkgs "python" [
  (python312.withPackages (
    ps: with ps; [
      beautifulsoup4
      black
      matplotlib
      numpy
      python-dotenv
      python-lsp-ruff
      requests
      scikit-learn
      setuptools
      urllib3
      virtualenv
    ]
  ))
  ruff-lsp
]

