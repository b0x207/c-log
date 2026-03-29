{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }: let
    forAllSystems = function:
      nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
      ] ( system: function nixpkgs.legacyPackages.${system} );
  in {    
    packages = forAllSystems (pkgs: {
      default = pkgs.stdenv.mkDerivation rec {
        pname = "c-log";
        version = "0.0.1";
        src = ./.;

        doCheck = true;

        nativeBuildInputs = with pkgs; [ cmake ];

        buildTestsFlags = if doCheck then
          [ "-DC_LOG_BUILD_TESTS=YES" ]
        else
          [ "" ];
        cmakeFlags = [
        ] ++ buildTestsFlags;
      };
    });
    devShells = forAllSystems (pkgs: {
      default = pkgs.mkShell {
        packages = with pkgs; [ cmake ];
      };
    });
  };
}
