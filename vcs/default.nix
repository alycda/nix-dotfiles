{ pkgs ? import <nixpkgs> {} }:

let
  thisDir = builtins.toString ./.;
in

pkgs.mkShell {
  buildInputs = with pkgs; [ jujutsu gh ]; # gk-cli

  shellHook = ''
    export VCS_CONFIG_DIR=''${VCS_CONFIG_DIR:-$PWD}

    alias jj="jj --config-file=$VCS_CONFIG_DIR/jj/config.toml"
    gh config set editor hx
  '';
}