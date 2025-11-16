{pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "cxxxr";
    userEmail = "g23tlm@gmail.com";
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
