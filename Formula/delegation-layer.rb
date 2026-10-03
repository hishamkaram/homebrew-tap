class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  version "0.1.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.18/delegation-layer_0.1.18_Darwin_arm64.tar.gz"
      sha256 "7a44f786db617dd6f2bc420d24a3541665203fe4f1e19d00c859a13e5f8cbc8f"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.18/delegation-layer_0.1.18_Darwin_amd64.tar.gz"
      sha256 "c90191f59699d8a580ca5dd3f8501fa0e14fc601c725c43aa605d45605a90638"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.18/delegation-layer_0.1.18_Linux_arm64.tar.gz"
      sha256 "db07682ec31498719d5a2233c291236fbdca73d12ad61269ffb17123fe08b034"
    else
      url "https://github.com/hishamkaram/delegation-layer/releases/download/v0.1.18/delegation-layer_0.1.18_Linux_amd64.tar.gz"
      sha256 "0894cdb9808d10f3056ce849118eb3756ae319d90be7c8cbc2d9fea7d6c0a9c9"
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
