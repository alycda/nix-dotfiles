{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [ pkgs.cheat ];

  # $EDITOR=/usr/bin/nano
  shellHook = ''
    export MY_VAR=''${MY_VAR:-$PWD}

    rm -rf ~/.config/cheat
    ln -s $MY_VAR/cheat-config ~/.config/cheat
  '';
}