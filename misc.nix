{pkgs, ...}: {
  home.packages = with pkgs; [
    tmux
    gnumake
    todoist-electron
  ];
}
