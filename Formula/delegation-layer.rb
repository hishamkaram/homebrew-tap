class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.6.0/delegation-layer_0.6.0_Darwin_arm64.tar.gz"
      sha256 "23047f41888023a85f08ef5b1df730d8271e0fd4a35e6d65fb11f49aa681751c"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.6.0/delegation-layer_0.6.0_Darwin_amd64.tar.gz"
      sha256 "f13ff21647a932309b021ec12ad113788fb331a0bc9cc72a97cf7eff710b5c61"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.6.0/delegation-layer_0.6.0_Linux_arm64.tar.gz"
      sha256 "5dc84d31da21de8daa720380dd9efaf4a1fbc02a6e8683867b210443c17626a0"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.6.0/delegation-layer_0.6.0_Linux_amd64.tar.gz"
      sha256 "ef2dc9c53b65cf5acb036f95783001fe14048c02d9876b793ecfb96bca51fec6"
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
