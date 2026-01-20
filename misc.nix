{pkgs, inputs, ...}: {
  home.packages = with pkgs; [
    openssl
    libnotify
    nodejs
    tmux
    gnumake
    todoist-electron
    obsidian
    inputs.llm-agents.packages.${pkgs.system}.codex
    awscli2
    ssm-session-manager-plugin
    aws-vault
    terraform
    uv
    gopls
    nodePackages.typescript-language-server
    inputs.llm-agents.packages.${pkgs.system}.spec-kit
    inputs.serena.packages.${pkgs.system}.serena
    ghostty
  ];

  home.sessionVariables = {
    EDITOR = "lem";
  };
}
