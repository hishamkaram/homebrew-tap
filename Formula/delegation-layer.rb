class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.1.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.16/delegation-layer_0.1.16_Darwin_arm64.tar.gz"
      sha256 "f6f95dfa5c995b75fed68b19197cddd4f582970da21f9e459a5451ef5fa24f1f"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.16/delegation-layer_0.1.16_Darwin_amd64.tar.gz"
      sha256 "a14e6857d15216df3f938c6325ee2a4a44855e8800f3018b22b705ea8811dc1e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.16/delegation-layer_0.1.16_Linux_arm64.tar.gz"
      sha256 "6751da76074ba1223d7860079691f1e9ad1b66674eec05d491d0d7afce50507c"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.16/delegation-layer_0.1.16_Linux_amd64.tar.gz"
      sha256 "9c4e83ad80c73ae6e296f7f7ede8dbfe1dfacc638e007af72791dc535b5f159a"
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
