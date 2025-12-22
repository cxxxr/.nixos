{pkgs, ...}: {
  home.packages = with pkgs; [
    tmux
    gnumake
    todoist-electron
    codex
    awscli2
    ssm-session-manager-plugin
    aws-vault
    uv
  ];

  home.sessionVariables = {
    EDITOR = "lem";
  };
}
