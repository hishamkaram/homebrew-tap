class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.1.10"
  license "MIT"

  depends_on "pueue"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.10/delegation-layer_0.1.10_Darwin_arm64.tar.gz"
      sha256 "1fe4d1ea1f048c9b4cbad350d7a7cb2679e65f6f964fa4ce6da763adeafc0768"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.10/delegation-layer_0.1.10_Darwin_amd64.tar.gz"
      sha256 "ecc81b5bac61162b67d8f8e3afc375ab03300f2714f8882ae602841834bec038"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.10/delegation-layer_0.1.10_Linux_arm64.tar.gz"
      sha256 "5f6e7ecdee786a13df97ab36f0c5943e90df1352b2943ac39b3646ec9729c99d"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.10/delegation-layer_0.1.10_Linux_amd64.tar.gz"
      sha256 "5ebe2cf152f62a697ee9b059d5f45256247e45a0d0ea6079d4a910a850d664b7"
    end
  end

  def install
    bin.install "delegate"
    bin.install "delegate-run"
  end

  test do
    assert_match "delegate #{version}", shell_output("#{bin}/delegate version")
    system bin/"delegate", "providers", "--json"
  end
end
