{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [ pkgs.cheat ];

  shellHook = ''
    ln -sf $(pwd)/cheat-config ~/.config/cheat
  '';
}