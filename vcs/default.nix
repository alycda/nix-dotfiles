{ pkgs ? import <nixpkgs> {} }:

let
  thisDir = builtins.toString ./.;
  hxWrapper = pkgs.writeShellScriptBin "hx-diff-wrapper" ''
    ${pkgs.helix}/bin/hx "$(dirname "$1")" "$2/JJ-INSTRUCTIONS"
  '';
in

pkgs.mkShell {
  buildInputs = with pkgs; [ jujutsu gh helix ] ++ [ hxWrapper ]; # gk-cli

  shellHook = ''
    export VCS_CONFIG_DIR=''${VCS_CONFIG_DIR:-$PWD}

    alias jj="jj --config-file=$VCS_CONFIG_DIR/jj/config.toml"
    # jj config set --user ui.diff-editor hx-diff-wrapper
    gh config set editor hx
  '';
}
