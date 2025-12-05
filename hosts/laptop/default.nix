# Host-specific configuration for laptop
{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Hostname
  networking.hostName = "laptop";

  # Host ID generated using: hostid
  networking.hostId = "007f0200";

  # Laptop-specific configuration
  # For example:
  # - Power management settings
  # - Battery optimization
  # - Touchpad configuration
  # - WiFi settings
  # - etc.

  # 内蔵キーボードを無効化（外付けキーボード使用時）
  #services.udev.extraRules = ''
    #ATTRS{name}=="AT Translated Set 2 keyboard", ENV{LIBINPUT_IGNORE_DEVICE}="1"
  #'';
}
