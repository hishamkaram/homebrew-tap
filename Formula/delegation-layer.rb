class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.1.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.27/delegation-layer_0.1.27_Darwin_arm64.tar.gz"
      sha256 "7ab6417e78f2a0976befd2679ddd17d463e8db24c9b2149576c8dc3eadffc993"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.27/delegation-layer_0.1.27_Darwin_amd64.tar.gz"
      sha256 "8d8233b58b9659c5a700de86fb0134baa6ebab5d9c75a2f960e0ae38e9587d21"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.27/delegation-layer_0.1.27_Linux_arm64.tar.gz"
      sha256 "f46de106d41f30cd64f22f3179d9f9aa77415a595e2758fab239e0263b421595"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.27/delegation-layer_0.1.27_Linux_amd64.tar.gz"
      sha256 "77493a11e388aa1471e7a779d500ae57b7695cdfd10df1bb4d0a9c0be0a75a5c"
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
