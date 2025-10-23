{ pkgs ? import <nixpkgs> {} }:

let
  cheatShell = import ./cheat/default.nix { inherit pkgs; };
  helixShell = import ./helix/default.nix { inherit pkgs; };
  rootDir = builtins.toString ./.;
in

pkgs.mkShell {
  buildInputs = cheatShell.buildInputs ++ helixShell.buildInputs;
  # shellHook = (cheatShell.shellHook or "") + (helixShell.shellHook or "$EDITOR=(which hx)")
  shellHook = ''
    export EDITOR="hx --config ${rootDir}/helix/helix-config}"
    export MY_VAR=''${PWD}/cheat
    ${cheatShell.shellHook or ""}
    export MY_VAR=''${PWD}/helix
    ${helixShell.shellHook or ""}
  '';
}