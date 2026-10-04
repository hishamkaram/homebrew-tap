class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.1.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.19/delegation-layer_0.1.19_Darwin_arm64.tar.gz"
      sha256 "180fe767b9f01f1a6349f83ce696e79192defedb898be074fe09923fc1ac5175"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.19/delegation-layer_0.1.19_Darwin_amd64.tar.gz"
      sha256 "ea95b96c73b941caadb8d000f89c64336b92a4d7d931ba511119d25a39aea7fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.19/delegation-layer_0.1.19_Linux_arm64.tar.gz"
      sha256 "56c0dadd27c1f0ac368fe9c7e0ebafa2a6db7f987924e7790809c552f00704ee"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.19/delegation-layer_0.1.19_Linux_amd64.tar.gz"
      sha256 "d84d677b1f3f7e1c9fee4b9711d660434d76d1363d286574c419aeac9b124bf2"
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
