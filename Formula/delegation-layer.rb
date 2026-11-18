class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.8.0/delegation-layer_0.8.0_Darwin_arm64.tar.gz"
      sha256 "be7ac96f876f4e936ae994d157d201e9673b6c05784b6a60f34a9a42a3ff5291"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.8.0/delegation-layer_0.8.0_Darwin_amd64.tar.gz"
      sha256 "688dc7ca5effc1bf5386aae6212acd7abce2c17a4d9911aa1f6d5ec0ca0e29bf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.8.0/delegation-layer_0.8.0_Linux_arm64.tar.gz"
      sha256 "0d1ef09a7aa1c633fbca406e8624707a489b162dd4cca5f4b5b1a45263937016"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.8.0/delegation-layer_0.8.0_Linux_amd64.tar.gz"
      sha256 "6cbbf4ed173b7bade6a05513ebf6a6568f1e3e85930c2f578f24e5477355dab2"
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
