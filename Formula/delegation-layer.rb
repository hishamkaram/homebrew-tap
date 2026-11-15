class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.6.1/delegation-layer_0.6.1_Darwin_arm64.tar.gz"
      sha256 "1d86834b00b47490f2314592f7395ace86afda2eea33f5dba67aa3941c66a140"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.6.1/delegation-layer_0.6.1_Darwin_amd64.tar.gz"
      sha256 "c81e80ea9fe52f646cd4fc6d1a202fef617a960aab0d8769d429a6ba90684cc9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.6.1/delegation-layer_0.6.1_Linux_arm64.tar.gz"
      sha256 "26c8f9e338a33c7cdc1b66e1faebda681b98ba895951623de4c47c12ae3c8efc"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.6.1/delegation-layer_0.6.1_Linux_amd64.tar.gz"
      sha256 "575dc1283edd07de3c961f3713986e3f469f46b6b39c3ba4aaa314591252e071"
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
