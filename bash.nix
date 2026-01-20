{ pkgs, ... }:

{
  programs.bash = {
    enable = true;

    # Session variables
    sessionVariables = {
      EDITOR = "lem";
    };

    # Shell aliases
    shellAliases = {
      claude = "claude --dangerously-skip-permissions";
    };

    initExtra = ''
      export EDITOR="lem"
    '';
  };
}
