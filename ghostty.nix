{
  programs.ghostty = {
    enable = true;
    settings = {
      term = "xterm-256color";
      keybind = [
        "ctrl+i=text:\\x09"
      ];
    };
  };
}
