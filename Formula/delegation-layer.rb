class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.3.0/delegation-layer_0.3.0_Darwin_arm64.tar.gz"
      sha256 "8a0968405126071b5e83d1a795ee7cb7aa4e6027fea9f111be4c4589d540476c"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.3.0/delegation-layer_0.3.0_Darwin_amd64.tar.gz"
      sha256 "7f669e6894c900aa96c8efb707ef6aedc713c28cd6612e6a5c6e7fff6b382df7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.3.0/delegation-layer_0.3.0_Linux_arm64.tar.gz"
      sha256 "a8aaf22094f3abf5ff9310f28b56ca803211bb1f6c2288dceba10cd7ef7d9830"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.3.0/delegation-layer_0.3.0_Linux_amd64.tar.gz"
      sha256 "a925bc221d8ab9a91447949f3a55914b09c62c4ddc841e17ec5b13d997f2a6d5"
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
