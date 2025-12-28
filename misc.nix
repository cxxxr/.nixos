{pkgs, inputs, ...}: {
  home.packages = with pkgs; [
    tmux
    gnumake
    todoist-electron
    codex
    awscli2
    ssm-session-manager-plugin
    aws-vault
    uv
    inputs.llm-agents.packages.${pkgs.system}.spec-kit
  ];

  home.sessionVariables = {
    EDITOR = "lem";
  };
}
