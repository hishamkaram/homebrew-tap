class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.4.1/delegation-layer_0.4.1_Darwin_arm64.tar.gz"
      sha256 "efc23d8015e83ac21b326c938d81a52ae768ad41fc26454012acd8b611ac8fc5"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.4.1/delegation-layer_0.4.1_Darwin_amd64.tar.gz"
      sha256 "10e6a2f01b307e642be88d5fe500e333345680357be62256985ad32570c704e7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.4.1/delegation-layer_0.4.1_Linux_arm64.tar.gz"
      sha256 "afc5f00f929f04a8be3b2254153c2fa3b48510a1903f73e2a8a5d522f689532f"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.4.1/delegation-layer_0.4.1_Linux_amd64.tar.gz"
      sha256 "7542f165a5ddaa5d3fe801d9f83a224986de3d66de9ed7c7097d35ec84bfc1f2"
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
