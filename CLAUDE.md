# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a NixOS flake-based configuration managing multiple machines with home-manager integration.

## Build Commands

```bash
# Rebuild NixOS system (auto-detects current host)
sudo nixos-rebuild switch --flake .

# Rebuild for a specific host
sudo nixos-rebuild switch --flake .#nucbox
sudo nixos-rebuild switch --flake .#laptop

# Apply home-manager configuration
home-manager switch --flake .#myHome

# Update flake inputs
nix flake update
```

## Architecture

**Flake Structure:**
- `flake.nix` - Entry point defining two NixOS configurations (`nucbox`, `laptop`) and one home-manager configuration (`myHome`)
- `configuration.nix` - Shared system configuration imported by all hosts
- `hosts/*/default.nix` - Host-specific overrides (hostname, hostId, hardware)
- `hosts/*/hardware-configuration.nix` - Auto-generated hardware config per machine
- `home.nix` - Home-manager entry point importing user-level modules

**Module Organization:**
- System-level programs/services go in `configuration.nix`
- User-level dotfiles and packages go in home-manager modules (`git.nix`, `bash.nix`, `tmux.nix`, `wezterm.nix`, `direnv.nix`, `misc.nix`)
- Custom scripts in `scripts/` are packaged via `scripts.nix`

**Key Design Decisions:**
- Uses `nixpkgs-unstable` channel
- GNOME desktop with GDM
- fcitx5 with Mozc for Japanese input
- Tailscale VPN enabled
- Rootless Docker enabled
