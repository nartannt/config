{ mkDevShell, pkgs }:

let  

  sfml = pkgs.sfml.overrideAttrs (oldAttrs: rec {
          version = "2.6.1";

          src = pkgs.fetchFromGitHub {
            owner = "SFML";
            repo = "SFML";
            rev = version;
            sha256 = "sha256-R+ULgaKSPadcPNW4D2/jlxMKHc1L9e4FprgqLRuyZk4=";
          };

          buildInputs = oldAttrs.buildInputs ++ [pkgs.xorg.libXcursor];
          cmakeFlags = oldAttrs.cmakeFlags ++ ["-DCMAKE_INSTALL_LIBDIR=lib"];
          patches = [];
        });


  buildInputs = [ sfml ];

        nativeBuildInputs =
          (with pkgs; [
            boehmgc
            sbt
            # which
          ])
          ++ (with pkgs.llvmPackages; [
           clang
           lld
           llvm
          ]);

        checkInputs = with pkgs; [
          doxygen
          gnumake
          xorg.xorgserver
          xorg.xset
        ];
in

pkgs.mkShell {
          name = "scala-native-sfml";
          packages = buildInputs ++ checkInputs ++ nativeBuildInputs ++ [ pkgs.metals ];

          env = {
            NIX_CFLAGS_COMPILE = "-Wno-unused-command-line-argument";
          };
          hardeningDisable = [ "fortify" ];
        }


#with pkgs;
#mkDevShell pkgs "scala" [ metals clang sbt scala scalafmt ]
#env = {
#    NIX_CFLAGS_COMPILE = "-Wno-unused-command-line-argument";
#};
#hardeningDisable = [ "fortify" ];
