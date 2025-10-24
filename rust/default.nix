{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    rustc
    just
    bacon
    presenterm
  ];

  shellHook = ''
    rustup update
  '';
}
