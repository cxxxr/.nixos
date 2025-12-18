final: prev: {
  codex = prev.rustPlatform.buildRustPackage rec {
    pname = "codex";
    version = "0.73.0";

    src = prev.fetchFromGitHub {
      owner = "openai";
      repo = "codex";
      tag = "rust-v${version}";
      hash = "sha256-6oVSscGpMcJGOJ90JuwmYe6HbFteoTdTPr2AGU84JzQ=";
    };

    sourceRoot = "${src.name}/codex-rs";

    cargoHash = "sha256-MN977yTfdESey0CK8vOXMKjY9HSXqRy1LgK7IYjNz1k=";

    nativeBuildInputs = with prev; [
      installShellFiles
      makeBinaryWrapper
      pkg-config
    ];

    buildInputs = [ prev.openssl ];

    doCheck = false;

    postInstall = ''
      installShellCompletion --cmd codex \
        --bash <($out/bin/codex completion bash) \
        --fish <($out/bin/codex completion fish) \
        --zsh <($out/bin/codex completion zsh)
    '';

    postFixup = ''
      wrapProgram $out/bin/codex --prefix PATH : ${prev.lib.makeBinPath [ prev.ripgrep ]}
    '';

    meta = with prev.lib; {
      description = "Lightweight coding agent that runs in your terminal";
      homepage = "https://github.com/openai/codex";
      license = licenses.asl20;
      mainProgram = "codex";
      platforms = platforms.unix;
    };
  };
}
