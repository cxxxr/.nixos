{pkgs, ...}: {
  home.packages = with pkgs; [
    gcc
    nodejs
    tmux
    gnumake
    ncurses
    openssl
    discord
  ];
}
