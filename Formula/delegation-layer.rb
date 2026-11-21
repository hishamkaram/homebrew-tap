class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.8.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.8.2/delegation-layer_0.8.2_Darwin_arm64.tar.gz"
      sha256 "707b9397c504823f12eced341d6853190e598ed8c3a7d4cf6ae6523a2b9520fa"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.8.2/delegation-layer_0.8.2_Darwin_amd64.tar.gz"
      sha256 "f96ac5f3574c94a80006562394321a36d5bbae5f5ad1a08642f24b62ab8aeff0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.8.2/delegation-layer_0.8.2_Linux_arm64.tar.gz"
      sha256 "3c0c2a51e0b6512eaa601e94e4a5a68e6eb964bad28727b55e8eaf8822c2932b"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.8.2/delegation-layer_0.8.2_Linux_amd64.tar.gz"
      sha256 "8ae8d843b9ea07e059faa357171baa41e0d58acc93e1af5559737b1b9c3b0193"
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
