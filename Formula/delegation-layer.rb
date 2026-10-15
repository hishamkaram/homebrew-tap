class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.1.28"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.28/delegation-layer_0.1.28_Darwin_arm64.tar.gz"
      sha256 "96cf632143281dba51fd3e42571abddddfce6ad89c500bb31f2cd5e53c4abac4"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.28/delegation-layer_0.1.28_Darwin_amd64.tar.gz"
      sha256 "0fe0b141682a45d6cd8b242ab0fa01f37751d75c8277b4f83a1fc13908dafe45"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.28/delegation-layer_0.1.28_Linux_arm64.tar.gz"
      sha256 "61d7b2dd6975b3dbedb1315cf358f7e7a0ecaff1ec498d6218824f6c35d36d4a"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.28/delegation-layer_0.1.28_Linux_amd64.tar.gz"
      sha256 "320f03819acef0005e77cbfd9c96fdb9d5d1d64972759a13958fc238855566f9"
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
