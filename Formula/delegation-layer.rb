class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.5.0/delegation-layer_0.5.0_Darwin_arm64.tar.gz"
      sha256 "627f010069ebc94cf4476bd376b635f1d848057edce81027d66e766df596507b"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.5.0/delegation-layer_0.5.0_Darwin_amd64.tar.gz"
      sha256 "6c4539820b971668747e2cb0f21f2cc73cb49663722754e1f7e912e64d84adaf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.5.0/delegation-layer_0.5.0_Linux_arm64.tar.gz"
      sha256 "7a9a8260c373b0228611bd7e437613a554d4c5d0751a1251e6447d1fb5ae315a"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.5.0/delegation-layer_0.5.0_Linux_amd64.tar.gz"
      sha256 "ac44ba864edf7d727663d903c25742b299e4ebe809137fdc673cf13f80b41e01"
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
