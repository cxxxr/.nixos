{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeScriptBin "tmux-reindex-windows" (builtins.readFile ./scripts/tmux-reindex-windows.sh))
  ];
}
