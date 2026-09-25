class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.1.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.11/delegation-layer_0.1.11_Darwin_arm64.tar.gz"
      sha256 "06348675d1031eceb26a807667027ffed27664f3802372411e517a0bb48c8304"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.11/delegation-layer_0.1.11_Darwin_amd64.tar.gz"
      sha256 "e105d2ede410dca0ebf1b2e106795a24aaf01e18d1cd6a4ede80a989ac08860f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.11/delegation-layer_0.1.11_Linux_arm64.tar.gz"
      sha256 "a59b3d37a7a1502e40d191a35a57074eaa9a44715608128684fc1abeab0623a9"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.11/delegation-layer_0.1.11_Linux_amd64.tar.gz"
      sha256 "663f2c2c86e2d6ba5786efd9aeb09f0a4ec3539d9c9539d0af59dda2ddff1479"
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
