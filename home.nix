{
  home = rec {
    username="user";
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
  };
  programs.home-manager.enable = true;

  imports = [
    ./git.nix
    ./misc.nix
    ./browser.nix
    ./terminal.nix
  ];
}
