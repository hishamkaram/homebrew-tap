class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.1.30"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.30/delegation-layer_0.1.30_Darwin_arm64.tar.gz"
      sha256 "5f0c5d9ba13d9e117ca3ce262a44319fccbf1d0d2fc79c64b09f51dd231b7a62"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.30/delegation-layer_0.1.30_Darwin_amd64.tar.gz"
      sha256 "ae805446c18ee1f9258ecee5b811540bc78db1eacab20f63c80045734d43845c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.30/delegation-layer_0.1.30_Linux_arm64.tar.gz"
      sha256 "232e2eb69a236d624299ce75168fd49fa9f96149737c30067ceeab95ec06bf86"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.30/delegation-layer_0.1.30_Linux_amd64.tar.gz"
      sha256 "efafe28f17947e0d6512736a619662aa001de5dad3b57846b555ac088b2f80fd"
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
