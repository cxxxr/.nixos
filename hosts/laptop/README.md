# Laptop Configuration

This directory contains the configuration for a laptop machine.

## Setup Instructions

When setting up this configuration on your actual laptop, follow these steps:

### 1. Generate Hardware Configuration

On your laptop, run:

```bash
sudo nixos-generate-config --show-hardware-config > hardware-configuration.nix
```

Then copy this file to this directory (hosts/laptop/).

### 2. Set Host ID

Generate a unique host ID:

```bash
hostid
```

Edit `default.nix` and uncomment the `networking.hostId` line with the value from the command above.

### 3. Customize Laptop Settings

Edit `default.nix` to add laptop-specific configurations such as:

- Power management (`services.tlp.enable = true;`)
- Battery optimization
- Touchpad settings
- WiFi configuration
- Display brightness controls
- etc.

### 4. Apply Configuration

Once you've pushed the changes to git and pulled them on your laptop:

```bash
cd ~/.nixos
sudo nixos-rebuild switch --flake .#laptop
```

After the first rebuild, the hostname will be set to "laptop" and subsequent rebuilds can use:

```bash
sudo nixos-rebuild switch --flake .
```
