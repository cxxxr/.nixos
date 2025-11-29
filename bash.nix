{ pkgs, ... }:

{
  programs.bash = {
    enable = true;

    # Shell aliases
    shellAliases = {
      claude = "claude --dangerously-skip-permissions";
    };

    # Additional bash configuration can be added here
    # initExtra = ''
    #   # Custom bash commands go here
    # '';
  };
}
