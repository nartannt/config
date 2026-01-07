{ ... }:

{
  mkDevShell =
    pkgs: name: packages:
    pkgs.mkShell {
      name = name;
      packages = packages;

      shellHook = ''
        export PS1="\[\e[0;37m\][\[\e[0;31m\]\u\[\e[0;37m\]@\[\e[0;32m\]\h\[\e[0;37m\]:\[\e[0;34m\]\w\[\e[0;37m\]] \[\e[0m\]\[\e[0;32m\]${name}\[\e[0m\] $ "
      '';
    };
}
