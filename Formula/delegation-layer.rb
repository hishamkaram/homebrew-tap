class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.1.38"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.38/delegation-layer_0.1.38_Darwin_arm64.tar.gz"
      sha256 "76d2226d4df2c474a18775d2d7069bf44440d1f0139916f625ffac8d6b311dc9"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.38/delegation-layer_0.1.38_Darwin_amd64.tar.gz"
      sha256 "1c93c56e12925d0ab212a038a934f30b632f4903bd2128ec7c0d6e391e9b9bd3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.38/delegation-layer_0.1.38_Linux_arm64.tar.gz"
      sha256 "a4f62a8a463e92c35ceb5e8eb302bf1d6950e88f1de769c1f5984c79f6e51527"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.38/delegation-layer_0.1.38_Linux_amd64.tar.gz"
      sha256 "d52ce7e8a28e7fae9ce6ea4d1cc3b08314a99684e070b1f8df1aedff56f20ea3"
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
