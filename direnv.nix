{ pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;  # nix-direnv for better performance
  };
}
