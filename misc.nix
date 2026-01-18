{pkgs, inputs, ...}: {
  home.packages = with pkgs; [
    openssl
    libnotify
    nodejs
    tmux
    gnumake
    todoist-electron
    obsidian
    codex
    awscli2
    ssm-session-manager-plugin
    aws-vault
    uv
    gopls
    nodePackages.typescript-language-server
    inputs.llm-agents.packages.${pkgs.system}.spec-kit
    inputs.serena.packages.${pkgs.system}.serena
  ];

  home.sessionVariables = {
    EDITOR = "lem";
  };
}
