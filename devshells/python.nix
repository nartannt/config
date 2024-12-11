# Standard python env. Please include your own in a project's flake.
# Couldn't get pylint to work. Is pylsp even reading the settings declared in
# vimrc?
{ python3, mkShell }:

let
  python-env = p: with p;
    [ matplotlib mypy notebook numpy pandas python-lsp-server ] # could also include sympy, scipy...
    ++ python-lsp-server.optional-dependencies.yapf
    ++ python-lsp-server.optional-dependencies.pyflakes;
in

mkShell {
  name = "python";
  packages = [ (python3.withPackages python-env) ];
}
