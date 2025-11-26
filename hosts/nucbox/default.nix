# Host-specific configuration for NucBox EVO-X2
{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Hostname
  networking.hostName = "nucbox";

  # Host ID (from hostid command)
  networking.hostId = "007f0200";

  # Add any other host-specific configuration here
  # For example:
  # - Boot loader options specific to this machine
  # - Network interfaces
  # - Display configuration
  # - etc.
}
