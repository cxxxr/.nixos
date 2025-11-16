{ pkgs, ... }:

{
  programs.wezterm = {
    enable = true;
  };

  home.file.".wezterm.lua".source = ./dotfiles/.wezterm.lua;
}
