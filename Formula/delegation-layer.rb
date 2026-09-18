class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.1.4"
  license "MIT"

  depends_on "pueue"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.4/delegation-layer_0.1.4_Darwin_arm64.tar.gz"
      sha256 "4949f1e38aa71e3f5ca6309e4fff0b5cec65abfdb46b87dad35915f392ba288e"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.4/delegation-layer_0.1.4_Darwin_amd64.tar.gz"
      sha256 "68f87b9d78a037ff39deba3d5f088428e9248d06c2ac7f21ebd9f268a2977ff2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.4/delegation-layer_0.1.4_Linux_arm64.tar.gz"
      sha256 "04d90675f6c53d47a6681ac27e5c44af181f14c8ba28be9d85be33022933c983"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.4/delegation-layer_0.1.4_Linux_amd64.tar.gz"
      sha256 "b1f272edc7949a8c40ef0e928e36570abfb2c04988cb0aab13fe80fd88a18d48"
    end
  end

  def install
    bin.install "delegate"
    bin.install "delegate-run"
  end

  test do
    assert_match "delegate #{version}", shell_output("#{bin}/delegate version")
    system bin/"delegate", "providers", "--json"
  end
end
