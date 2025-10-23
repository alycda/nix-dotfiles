{ pkgs ? import <nixpkgs> {} }:

let
  cheatShell = import ./cheat/default.nix { inherit pkgs; };
  helixShell = import ./helix/default.nix { inherit pkgs; };
  rootDir = builtins.toString ./.;
in

pkgs.mkShell {
  buildInputs = cheatShell.buildInputs ++ helixShell.buildInputs;
  shellHook = ''
    export HELIX_CONFIG_DIR=''${PWD}/helix
    ${helixShell.shellHook or ""}

    export EDITOR="hx --config ${rootDir}/helix/helix-config/config.toml"
    alias hx="hx --config $HELIX_CONFIG_DIR/helix-config/config.toml"

    export CHEAT_CONFIG_DIR=''${PWD}/cheat
    ${cheatShell.shellHook or ""}
  '';
}