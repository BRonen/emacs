{
  description = "Emacs build setup";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

  outputs =
    { self
    , flake-utils
    , nixpkgs
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShell = pkgs.mkShell {
          packages = with pkgs; [
            bashInteractive
          ];
          buildInputs = with pkgs; [
            autoconf
            gnumake
            gtk4
            webkitgtk
            pkg-config
            xorg.libXaw
            xorg.libXpm
            libungif
            texinfo
            ncurses
            gnutls
            zlib
            libgccjit
          ];
        };
      }
    );
}
