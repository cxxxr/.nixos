{
  home = rec {
    username="user";
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
  };
  programs.home-manager.enable = true;

  packages = with pkgs; [
    bat
    bottom
    exa
    httpie
    pingu
    ripgrep
  ];

  imports = [
    ./git.nix
    ./browser.nix
  ];
}
