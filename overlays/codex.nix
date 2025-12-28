final: prev: {
  codex = prev.rustPlatform.buildRustPackage rec {
    pname = "codex";
    version = "0.77.0";

    src = prev.fetchFromGitHub {
      owner = "openai";
      repo = "codex";
      tag = "rust-v${version}";
      hash = "sha256-05zjzCrVhPLvrqx9UA2dPOjP8mQFUTWBCrmq/iaR3hg=";
    };

    sourceRoot = "${src.name}/codex-rs";

    cargoHash = "sha256-bxy8YaUxsud3Gg09ebJyo0WNFvt76dcQTQ50B+xSbJU=";

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
