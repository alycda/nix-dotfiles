{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    rustc
    just
    bacon
    presenterm

    lolcat
  ];

  shellHook = ''
    rustup update | lolcat
  '';
}
