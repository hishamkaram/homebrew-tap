class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.7.0/delegation-layer_0.7.0_Darwin_arm64.tar.gz"
      sha256 "bdff48d1e9df1ce728a49a620a2c2075c8fa46991caf4d290fe8f8a3d64a6fbe"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.7.0/delegation-layer_0.7.0_Darwin_amd64.tar.gz"
      sha256 "79c8206ed2a127208e6c0979aa66cce5045b9791ba2ba503b8a5535846a19d84"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.7.0/delegation-layer_0.7.0_Linux_arm64.tar.gz"
      sha256 "284d2695ff33fb53eef30eda1dc0689b22e68d290d61a555e2bd7579ddba9cfe"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.7.0/delegation-layer_0.7.0_Linux_amd64.tar.gz"
      sha256 "37e3a1b72da7396a1d2b3e080f6f262d84811c726d1e235668130ce39a129efc"
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
