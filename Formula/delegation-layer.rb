class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.2.0/delegation-layer_0.2.0_Darwin_arm64.tar.gz"
      sha256 "602ed00162547b2f1882021d47cb4e0ff452353b9efba7a37f813e935cb6da6c"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.2.0/delegation-layer_0.2.0_Darwin_amd64.tar.gz"
      sha256 "ab17b6ec8c3327bcad15f005d2d80375ac823cefcb3742f22c0cd6bce4ce3959"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.2.0/delegation-layer_0.2.0_Linux_arm64.tar.gz"
      sha256 "d27c31e63cecc8870e1e034fa2f60373be51fefd1a03ec6a455fbf1ca41c0130"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.2.0/delegation-layer_0.2.0_Linux_amd64.tar.gz"
      sha256 "da11577612dcca81bedc7258480faf6cd94e48386ffc3c7265eb806f7c856186"
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
