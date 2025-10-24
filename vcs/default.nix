{ pkgs ? import <nixpkgs> {} }:

let
  thisDir = builtins.toString ./.;
  hxDiffWrapper = import ./pkgs/hx-diff-wrapper { inherit pkgs; };
in

pkgs.mkShell {
  buildInputs = with pkgs; [ jujutsu gh helix ] ++ [ hxDiffWrapper ]; # gk-cli

  shellHook = ''
    export VCS_CONFIG_DIR=''${VCS_CONFIG_DIR:-$PWD}

    alias jj="jj --config-file=$VCS_CONFIG_DIR/jj/config.toml"
    # jj config set --user ui.diff-editor hx-diff-wrapper
    gh config set editor hx
  '';
}