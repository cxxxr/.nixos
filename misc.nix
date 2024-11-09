{pkgs, ...}: {
  home.packages = with pkgs; [
    gcc
    sbcl
    nodejs
    tmux
    gnumake
    ncurses
    openssl
    discord
  ];
}
