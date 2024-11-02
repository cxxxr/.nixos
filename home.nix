{
  home = rec {
    username="user";
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
  };
  programs.home-manager.enable = true;

  imports = [
    ./git.nix
    ./browser.nix
  ];
  home.packages = with pkgs; [
    bat
    bottom
    exa
    httpie
    pingu
    ripgrep
  ];
}
