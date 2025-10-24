{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [ helix ];

  shellHook = ''
    export HELIX_CONFIG_DIR=''${HELIX_CONFIG_DIR:-$PWD}

    alias hx="hx --config $HELIX_CONFIG_DIR/helix-config/config.toml"
  '';
}