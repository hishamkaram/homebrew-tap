class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.1.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.29/delegation-layer_0.1.29_Darwin_arm64.tar.gz"
      sha256 "a3919fd5837b94dcb56868467642983bb17054cd012a97ff54c8602bdeaaee25"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.29/delegation-layer_0.1.29_Darwin_amd64.tar.gz"
      sha256 "8217afb7a5b7b46f84023bbb50375c20d28150a760d580f28f18efe9faf6ac70"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.29/delegation-layer_0.1.29_Linux_arm64.tar.gz"
      sha256 "ddf2c67cfb17e3d3cd487e91cc14fed8f700ade16caee407d3f0ce781ac134df"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.29/delegation-layer_0.1.29_Linux_amd64.tar.gz"
      sha256 "d84cd064daded7955f66c180d1ea0a23ad2d7f5cdaac13553bf5dc0241199b27"
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
