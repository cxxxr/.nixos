{pkgs, ...}: {
  home.packages = with pkgs; [
    tmux
    gnumake
    todoist-electron
    codex
    awscli2
    uv
  ];

  home.sessionVariables = {
    EDITOR = "lem";
  };
}
