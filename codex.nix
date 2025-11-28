{pkgs, ...}: {
  home.packages = [
    (pkgs.codex.overrideAttrs (oldAttrs: rec {
      version = "0.63.0";
      src = pkgs.fetchFromGitHub {
        owner = "openai";
        repo = "codex";
        rev = "v${version}";
        hash = "";  # 最初は空にして、エラーメッセージから正しいハッシュを取得
      };
    }))
  ];
}
