{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    helix

    # Language servers for languages.toml
    rust-analyzer                           # Rust LSP
    nodePackages.typescript-language-server # TypeScript/JavaScript LSP
    vscode-langservers-extracted            # JSON LSP (vscode-json-languageserver)

    # Debuggers (provides lldb-dap for DAP debugging)
    lldb
  ];

  shellHook = ''
    export HELIX_CONFIG_DIR=''${HELIX_CONFIG_DIR:-$PWD}

    alias hx="hx --config $HELIX_CONFIG_DIR/helix-config/config.toml"
  '';
}