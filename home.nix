{
  home = rec {
    username="user";
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };
  programs.home-manager.enable = true;

  imports = [
    ./git.nix
    ./misc.nix
    ./wezterm.nix
    ./tmux.nix
    ./scripts.nix
    ./bash.nix
    ./direnv.nix
  ];
}
