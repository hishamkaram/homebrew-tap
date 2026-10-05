class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.1.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.21/delegation-layer_0.1.21_Darwin_arm64.tar.gz"
      sha256 "99d214735a8ed6b9eed67290fa358f20633b1baad79bedf506d7d495bd77a782"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.21/delegation-layer_0.1.21_Darwin_amd64.tar.gz"
      sha256 "29893dd0e053692017d355b1703f3733429a5567971c46a68b5dcbe103423685"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.21/delegation-layer_0.1.21_Linux_arm64.tar.gz"
      sha256 "9279848e1346fc01aacfb917d38254592b57ec796a45ddf873db2221544af6b6"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.21/delegation-layer_0.1.21_Linux_amd64.tar.gz"
      sha256 "18789ecdeb43031d06e555386c22fa57229cfa1c6a06942a13dc66edba2af0ce"
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
