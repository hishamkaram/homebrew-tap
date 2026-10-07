class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.1.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.25/delegation-layer_0.1.25_Darwin_arm64.tar.gz"
      sha256 "f5b6f6580097c70421c46bf8bdbf327ca5cc2341c1587bb4c5bd5c8d5c7ea17d"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.25/delegation-layer_0.1.25_Darwin_amd64.tar.gz"
      sha256 "2aa5ed88c779f43fab5405d66e4be9a564d83cffef9b4d3054047856363cc6fe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.25/delegation-layer_0.1.25_Linux_arm64.tar.gz"
      sha256 "592e6cf7c7507326b3bcacb3f49dffac620601789aeaad82cfd2e79934955c49"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.25/delegation-layer_0.1.25_Linux_amd64.tar.gz"
      sha256 "e76dcff20f44b1ede3734a100077429b2ac7c6b1edbe76ae4cc457960db6d82d"
    end
  end

  def install
    bin.install "delegate"
    bin.install "delegate-run"
    libexec.install "pueue", "pueued"
  end

  test do
    assert_match "delegate #{version}", shell_output("#{bin}/delegate version")
    system bin/"delegate", "providers", "--json"
    assert_match "pueue ", shell_output("#{libexec}/pueue --version")
    assert_match "pueued ", shell_output("#{libexec}/pueued --version")
  end
end
