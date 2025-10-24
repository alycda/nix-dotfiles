{ pkgs ? import <nixpkgs> {
        config.allowUnfree = true;
    } 
}:

let
  thisDir = builtins.toString ./.;
in

pkgs.mkShell {
  buildInputs = with pkgs; [ claude-code gh ];

  # https://docs.claude.com/en/docs/claude-code/cli-reference  
}
