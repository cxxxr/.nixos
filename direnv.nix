{ pkgs, ... }:

{
  # Enable bash (required for direnv integration to work)
  programs.bash = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;  # nix-direnv for better performance
  };
}
