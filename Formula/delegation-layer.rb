class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.1.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.32/delegation-layer_0.1.32_Darwin_arm64.tar.gz"
      sha256 "e1b28265aaa3f54a58997326f09035f4fd049819937acf0df8bafd03d5b1fdee"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.32/delegation-layer_0.1.32_Darwin_amd64.tar.gz"
      sha256 "534fc42c6770ce990046a0ccbee08462ed780b92bb62244b6b09e210eaa189b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.32/delegation-layer_0.1.32_Linux_arm64.tar.gz"
      sha256 "6b442bde96f06e64cfcefe9ad554fc5552bf78d3a0947222440694801c38815e"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.32/delegation-layer_0.1.32_Linux_amd64.tar.gz"
      sha256 "58b1ede742c9797d708cb2c2a7e1e05da2788cbb25e7a3d280c8bd9f31c8d6d7"
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
