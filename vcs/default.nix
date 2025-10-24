{ pkgs ? import <nixpkgs> {} }:

let
  thisDir = builtins.toString ./.;
in

pkgs.mkShell {
  buildInputs = [ pkgs.jujutsu pkgs.gh pkgs.gk-cli ];

  shellHook = ''
    export VCS_CONFIG_DIR=''${VCS_CONFIG_DIR:-$PWD}

    alias jj="jj --config-file=$VCS_CONFIG_DIR/jj/config.toml"
    gh config set editor hx
  '';
}