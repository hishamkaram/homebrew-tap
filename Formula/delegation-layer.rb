class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.4.0/delegation-layer_0.4.0_Darwin_arm64.tar.gz"
      sha256 "faec805b8c7bc3e4953a1ddb26a656abbb1a93a989a96c75d736459cba6ed51c"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.4.0/delegation-layer_0.4.0_Darwin_amd64.tar.gz"
      sha256 "dc3be49439a173dd047664ac1a9ceb1989c2a76b0cc5cf93d0aa263d98c9527d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.4.0/delegation-layer_0.4.0_Linux_arm64.tar.gz"
      sha256 "9523089a49bc1b6051e08c4e1f7c12afc18ed38b1a21180419d395cd86fb39d1"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.4.0/delegation-layer_0.4.0_Linux_amd64.tar.gz"
      sha256 "c3431c3e3b979b096367535c6a58167b9eff3a02156fc4078972791a8fa7f85d"
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
