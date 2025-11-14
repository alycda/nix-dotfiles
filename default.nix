{ pkgs ? import <nixpkgs> {
    config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "claude-code"
    ];
  }
, lib ? pkgs.lib
}:

let
  cheatShell = import ./cheat/default.nix { inherit pkgs; };
  helixShell = import ./helix/default.nix { inherit pkgs; };
  vcsShell = import ./vcs/default.nix     { inherit pkgs; };
  rustShell = import ./rust/default.nix   { inherit pkgs; };
  agentShell = import ./agent/default.nix { inherit pkgs; };
  rootDir = builtins.toString ./.;
in

pkgs.mkShell {
  # Merge all the package lists together
  # see https://nixos.org/manual/nixpkgs/unstable/#var-stdenv-buildInputs
  buildInputs = with pkgs; [
    # Packages from the sub‑shells
    cheatShell.buildInputs
    helixShell.buildInputs
    vcsShell.buildInputs
    rustShell.buildInputs
    agentShell.buildInputs

    # extra utilities
    eza
    ripgrep
    ripgrep-all
    asciinema_3
    lolcat
  ];
  
  shellHook = ''
    export HELIX_CONFIG_DIR=${rootDir}/helix
    ${helixShell.shellHook or ""}

    export EDITOR="hx --config ${rootDir}/helix/helix-config/config.toml"
    alias hx="hx --config $HELIX_CONFIG_DIR/helix-config/config.toml"

    export CHEAT_CONFIG_DIR=${rootDir}/cheat
    ${cheatShell.shellHook or ""}

    export VCS_CONFIG_DIR=${rootDir}/vcs
    ${vcsShell.shellHook or ""}

    ${rustShell.shellHook or ""}
  '';
}
