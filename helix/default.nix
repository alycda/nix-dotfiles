{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [ pkgs.helix ];

  shellHook = ''
    export MY_VAR=''${MY_VAR:-$PWD}

    alias hx="hx --config $MY_VAR/helix-config/config.toml"
  '';
}