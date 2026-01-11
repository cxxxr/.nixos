{pkgs, ...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "cxxxr";
        email = "g23tlm@gmail.com";
      };
      push.autoSetupRemote = true;
    };
  };

  # GitHub CLI
  programs.gh = {
    enable = true;
    extensions = with pkgs; [gh-markdown-preview];
    settings = {
      editor = "nano";
    };
  };
}
