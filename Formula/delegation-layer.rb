class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.1.39"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.39/delegation-layer_0.1.39_Darwin_arm64.tar.gz"
      sha256 "2e373f999a4a12fec08927e512ff79896ffc5f73ce58898b03ffcfa8cccbce21"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.39/delegation-layer_0.1.39_Darwin_amd64.tar.gz"
      sha256 "0e1309e18b40fa243affb6f0130f53629f81781e43f54f8641e4595a647e705c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.39/delegation-layer_0.1.39_Linux_arm64.tar.gz"
      sha256 "3f0d1fec997280f22d0f8ebefc75647358a70daf42b3d98faf8a3b24489d374c"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.39/delegation-layer_0.1.39_Linux_amd64.tar.gz"
      sha256 "fedc7f78bc218ea439e426c57b0be5b64b7f7a89d99711cbe6685bae3023aa11"
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
