class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.1.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.14/delegation-layer_0.1.14_Darwin_arm64.tar.gz"
      sha256 "3540ba749a2c81a6480e4c4ffc6c4609acb8e09485a408e8c75c20bffedfddce"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.14/delegation-layer_0.1.14_Darwin_amd64.tar.gz"
      sha256 "538805f594156de5eeaed87b95e234865c09a963535e0f1a22e7c60aab7ebe2d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.14/delegation-layer_0.1.14_Linux_arm64.tar.gz"
      sha256 "115d1c621ef1d3599b0b550f652e891fa1da4af04150278e21ad25639bd4b1d6"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.14/delegation-layer_0.1.14_Linux_amd64.tar.gz"
      sha256 "ce17413d11e40b10f478c8b8f38294edea2ed213d283c394ae787cb57a3b5d5b"
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
