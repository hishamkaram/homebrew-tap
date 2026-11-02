class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.3.1/delegation-layer_0.3.1_Darwin_arm64.tar.gz"
      sha256 "43f3be5957b4df05550e7e0ebb6dec971ae78c027204fbbf2fb8f0444ee6326b"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.3.1/delegation-layer_0.3.1_Darwin_amd64.tar.gz"
      sha256 "7e8bb4604e2891f604974a11592276c73f3690caa99e43fecca6416a3bf16282"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.3.1/delegation-layer_0.3.1_Linux_arm64.tar.gz"
      sha256 "a1553e95f67aec07d50fa9f2b2a1c54188fa4518be6aeeef429596d912588475"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.3.1/delegation-layer_0.3.1_Linux_amd64.tar.gz"
      sha256 "a779a3fb89382ef9c695d6110878770d2709f34c78215465e08d6ab9e3af17ef"
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
