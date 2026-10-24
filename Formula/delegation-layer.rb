class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.1.37"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.37/delegation-layer_0.1.37_Darwin_arm64.tar.gz"
      sha256 "6f3c9fea154bb8d7a4df2440b63fe5152ef6b01913572cad25d5928dbf79f9f2"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.37/delegation-layer_0.1.37_Darwin_amd64.tar.gz"
      sha256 "f9ac83009d936c21d0af94fa57689e53dcd22ea1855d71bf3d075eed8ac49084"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.37/delegation-layer_0.1.37_Linux_arm64.tar.gz"
      sha256 "1ef5197aec80a21e143a42add23547d86bfa0170b3a9e6ca72d20884a7311e5d"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.37/delegation-layer_0.1.37_Linux_amd64.tar.gz"
      sha256 "617e7733125b927a1d7f8151d72de49997c7baad24dce5deff01ae69e7a952f4"
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
