{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [ cheat ];

  shellHook = ''
    export CHEAT_CONFIG_DIR=''${CHEAT_CONFIG_DIR:-$PWD}

    rm -rf ~/.config/cheat
    ln -s $CHEAT_CONFIG_DIR/cheat-config ~/.config/cheat
  '';
}
