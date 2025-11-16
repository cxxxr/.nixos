{ pkgs, ... }:

{
  programs.wezterm = {
    enable = true;
  };

  home.file.".wezterm.lua".source = ./dot.wezterm.lua;
}
