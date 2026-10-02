class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.1.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.17/delegation-layer_0.1.17_Darwin_arm64.tar.gz"
      sha256 "4a5e5d0463d769ca41451a96f1bc1cd398a5339c9659c875a9e00f6c4db311ba"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.17/delegation-layer_0.1.17_Darwin_amd64.tar.gz"
      sha256 "7f756c0c247c538476a285d65be14004ee222452881c155da6f26181843fd720"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.17/delegation-layer_0.1.17_Linux_arm64.tar.gz"
      sha256 "09c1ac51a1aeab271b7d25f44d3b4f315ab7f18cfb1b770c3901c54b9da47a7b"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.17/delegation-layer_0.1.17_Linux_amd64.tar.gz"
      sha256 "d16bc305b49e9dcb61a5c0cce60f9aa5231f11ec9a18c1b6f40e0e5be77a459c"
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
