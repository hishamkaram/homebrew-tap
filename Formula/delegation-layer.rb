class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.1.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.12/delegation-layer_0.1.12_Darwin_arm64.tar.gz"
      sha256 "514c9169b7149fa741f2e5cb31037767e62073015841a3f84bc864350653bf67"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.12/delegation-layer_0.1.12_Darwin_amd64.tar.gz"
      sha256 "5a3121ae2bce1795c9013ba5bcec1e1eec3cd34b6b2578e95a85d2d5bff3a2fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.12/delegation-layer_0.1.12_Linux_arm64.tar.gz"
      sha256 "952b69455dc1feefb8ea01c473161345cd1d902f2089c96a9786034db7cb7268"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.12/delegation-layer_0.1.12_Linux_amd64.tar.gz"
      sha256 "5b64d8820fef26ede90d9e3f027c1535207bf623cbe49b50c19fab63b64086cd"
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
