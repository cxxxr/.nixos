{pkgs, ...}: {
  home.packages = with pkgs; [
    gcc
    sbcl
    nodejs
  ];
}
