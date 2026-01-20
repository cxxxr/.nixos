{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeScriptBin "tmux-reindex-windows" (builtins.readFile ./scripts/tmux-reindex-windows.sh))
    (pkgs.writeScriptBin "screenshot-for-claude" (builtins.readFile ./scripts/screenshot-for-claude.sh))
  ];
}
