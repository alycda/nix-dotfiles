# Nix Dotfiles

A collection of development environment configurations using Nix expressions.

## Quick Start

### Using Pre-built Releases (Recommended)

The easiest way to use these dotfiles is with the pre-built tarballs from GitHub releases:

```bash
# Use directly with nix-shell (replace v1.0.0 with latest version)
nix-shell https://github.com/YOUR_USERNAME/nix-dotfiles/releases/download/v1.0.0/nix-dotfiles.tar.gz
```

### Manual Installation

```bash
# Download and extract
curl -L https://github.com/YOUR_USERNAME/nix-dotfiles/releases/download/v1.0.0/nix-dotfiles.tar.gz | tar -xz
cd nix-dotfiles
nix-shell
```

### Development Setup

If you want to modify the configurations:

```bash
git clone https://github.com/YOUR_USERNAME/nix-dotfiles.git
cd nix-dotfiles
nix-shell
```

## What's Included

This nix-shell environment provides:

### Helix Editor
- Modern modal text editor
- Custom configuration with themes and language support
- BrightScript language support
- Custom keybindings and settings

### Cheat
- Command-line cheatsheets
- Git workflow cheatsheets
- Community cheatsheets for common tasks

### Rust Development
- Rust compiler (`rustc`)
- Task runner (`just`)
- Background compilation (`bacon`)
- Presentation tool (`presenterm`)

## File Structure

```
.
├── default.nix           # Main nix expression
├── cheat/
│   ├── default.nix       # Cheat configuration
│   └── cheat-config/     # Cheat sheets and configuration
├── helix/
│   ├── default.nix       # Helix editor configuration
│   └── helix-config/     # Themes, language configs, etc.
└── rust/
    └── default.nix       # Rust development tools
```

## Customization

Each directory contains its own `default.nix` file that can be modified independently:

- `cheat/default.nix` - Configure cheat tool and add custom cheatsheets
- `helix/default.nix` - Helix editor setup and aliases
- `rust/default.nix` - Rust development packages

The main `default.nix` combines all configurations into a single shell environment.

## CI/CD

This repository automatically builds tarballs on:
- Pushes to main/master branch
- Tagged releases

Each tarball contains:
- Single top-level `nix-dotfiles/` directory
- All nix expressions and configuration files
- No dotfiles or git history
- SHA256 and MD5 checksums for verification

## Contributing

1. Fork the repository
2. Make your changes
3. Test with `nix-shell`
4. Submit a pull request

## License

[Add your license here]