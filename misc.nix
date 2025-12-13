{pkgs, ...}: {
  home.packages = with pkgs; [
    tmux
    gnumake
    todoist-electron
    codex
    awscli2
  ];

  home.sessionVariables = {
    EDITOR = "lem";
  };
}
