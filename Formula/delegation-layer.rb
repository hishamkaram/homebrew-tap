class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.1.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.22/delegation-layer_0.1.22_Darwin_arm64.tar.gz"
      sha256 "6dc72d25c9f69eafde22dd815bd6f3a695c60cff493490e780942d1de399f875"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.22/delegation-layer_0.1.22_Darwin_amd64.tar.gz"
      sha256 "cc2baf85c2e5ec036e03d632d957094f70412da940288dfe4c1df4e3003bf80d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.22/delegation-layer_0.1.22_Linux_arm64.tar.gz"
      sha256 "b015d115f1acf97f1fefc1c26e5f966411b00e645b40ca067de7593ff37eff63"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.22/delegation-layer_0.1.22_Linux_amd64.tar.gz"
      sha256 "0b6d4692f6edc38ea1c8daaf5e1da01a73913c33b116e191800c83e58de9ea44"
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
