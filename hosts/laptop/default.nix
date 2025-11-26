# Host-specific configuration for laptop
{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Hostname
  networking.hostName = "laptop";

  # Host ID will be generated on the actual laptop using: hostid
  # networking.hostId = "xxxxxxxx";

  # Laptop-specific configuration
  # For example:
  # - Power management settings
  # - Battery optimization
  # - Touchpad configuration
  # - WiFi settings
  # - etc.
}
