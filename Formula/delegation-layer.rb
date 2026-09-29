class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.1.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.13/delegation-layer_0.1.13_Darwin_arm64.tar.gz"
      sha256 "728655e5bb027c925858b23064acbe6a9b78884a5bf6933042a69296f1c30ea2"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.13/delegation-layer_0.1.13_Darwin_amd64.tar.gz"
      sha256 "12be0cb8e651f366d15471ca629f66569973c988385b791fb3b66b32f59aa399"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.13/delegation-layer_0.1.13_Linux_arm64.tar.gz"
      sha256 "c4b4e0540b045adc9846726d68a29f6bd7a5709d0e63c3f83cab00bdff3c537e"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.13/delegation-layer_0.1.13_Linux_amd64.tar.gz"
      sha256 "3482ab8b9008aec2734e1d9f009c3a7e3d271591568cff9ec4e396dea56f9ec5"
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
