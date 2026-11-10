class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.5.1/delegation-layer_0.5.1_Darwin_arm64.tar.gz"
      sha256 "2433175d23d3e8bdfd0953f162b57817efe896ae9ac38cdfb7cd7e8d555e58a1"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.5.1/delegation-layer_0.5.1_Darwin_amd64.tar.gz"
      sha256 "a847d189198b18584f3012a61e31ff827d23f0caa95de85fbb9b6cecfbc39c37"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.5.1/delegation-layer_0.5.1_Linux_arm64.tar.gz"
      sha256 "32dd6973636bcf8ff55f699daa84309e45a93e114962876feb2427d3ddf15f81"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.5.1/delegation-layer_0.5.1_Linux_amd64.tar.gz"
      sha256 "e65e0611255dc5241094e4164ffad19ce9b0073ffec07c80f0ec61d26f84694f"
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
