class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.1.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.20/delegation-layer_0.1.20_Darwin_arm64.tar.gz"
      sha256 "4cb4eff3be848bb288862fe3759b91fcf4eaa76d5e2c2860a2680d258f36a498"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.20/delegation-layer_0.1.20_Darwin_amd64.tar.gz"
      sha256 "f7ea3a0d8823f78a02269d49697c5cf391f02fc01b6a1cc846b9efa4138daa5c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.20/delegation-layer_0.1.20_Linux_arm64.tar.gz"
      sha256 "aa51d3e8c67bfac4cdc3bf39e2932e467fdc8912007c09dc129e93f6ebd9af6e"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.20/delegation-layer_0.1.20_Linux_amd64.tar.gz"
      sha256 "ea845045014136069a3fe7c80dd5b61266b1d2f490a0ad01ba6aab4d89af2601"
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
