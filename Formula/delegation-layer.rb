class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.8.1/delegation-layer_0.8.1_Darwin_arm64.tar.gz"
      sha256 "22606d624349bc841157304de42e7bfdd7a2e9287191b214c0d199efc9d542e6"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.8.1/delegation-layer_0.8.1_Darwin_amd64.tar.gz"
      sha256 "8597feddc0765ae26647bf6638329872241a5b753449f0b41edef187a354799e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.8.1/delegation-layer_0.8.1_Linux_arm64.tar.gz"
      sha256 "814bd908ce58220662f948a1c816664d8d186eeeca340b56189ffce4ab728f34"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.8.1/delegation-layer_0.8.1_Linux_amd64.tar.gz"
      sha256 "bbeb589c4cb4c6d06b19c57a199fe63cab09e113f687f4af6924193adbbbca69"
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
