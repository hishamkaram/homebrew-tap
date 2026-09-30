class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.1.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.15/delegation-layer_0.1.15_Darwin_arm64.tar.gz"
      sha256 "e62c9c7fd3508f1bfbb13ae1a6742f8291dd32102707f7085c4f9fd179e074cd"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.15/delegation-layer_0.1.15_Darwin_amd64.tar.gz"
      sha256 "c0f5df074be5610bac33266c91399d2626829cedef7df5db2f54bd16000ebccf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.15/delegation-layer_0.1.15_Linux_arm64.tar.gz"
      sha256 "4382c276abbf48a8bf4c32c8334ce73e3a5772f94fae350b182ad965f6eea1e9"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.15/delegation-layer_0.1.15_Linux_amd64.tar.gz"
      sha256 "e6b01ab60c75c70b6a9a27fe34e029b34f78d3efb67f25617f7b7bd05330ef89"
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
