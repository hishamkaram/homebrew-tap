class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.4.2/delegation-layer_0.4.2_Darwin_arm64.tar.gz"
      sha256 "a99017e5418b98189a7ae38cfdd175a27e4a6c8f4a706bb03d75456df79adfb1"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.4.2/delegation-layer_0.4.2_Darwin_amd64.tar.gz"
      sha256 "2daa42a0a88503976216bb06230535dc5e28503e20285f4af6e66f9c6373aaab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.4.2/delegation-layer_0.4.2_Linux_arm64.tar.gz"
      sha256 "bf048970128f506815c7958a76c0550f2f413638629aaf88132cf0bfb6b22181"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.4.2/delegation-layer_0.4.2_Linux_amd64.tar.gz"
      sha256 "318ac02fd3a5802950ccc61b430edbaf283e83648ea1be9efbe785ed13a7b40a"
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
