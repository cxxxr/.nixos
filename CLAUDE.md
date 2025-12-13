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
- Package overlays in `overlays/` for customizing nixpkgs packages (e.g., newer versions)

**Key Design Decisions:**
- Uses `nixpkgs-unstable` channel
- GNOME desktop with GDM
- fcitx5 with Mozc for Japanese input
- Tailscale VPN enabled
- Rootless Docker enabled

## Overlays

Overlays in `overlays/` customize nixpkgs packages. Currently:
- `codex.nix` - OpenAI Codex CLI (newer version than nixpkgs)

**Updating overlay packages:**
1. Update `version` in the overlay file
2. Update `hash` - run `nix-prefetch-url --unpack <github-tarball-url>` and convert to SRI format
3. Set `cargoHash = ""` temporarily
4. Run `home-manager build --flake .#myHome` to get the correct cargoHash from error
5. Update `cargoHash` with the value from step 4
6. Run `home-manager switch --flake .#myHome`
