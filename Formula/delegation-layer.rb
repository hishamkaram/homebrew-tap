class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  url "https://codeload.github.com/hishamkaram/delegation-layer/tar.gz/refs/tags/v0.1.1"
  sha256 "264de69aa7a1e7c81690ba33b4e574171d6cfda313a5aa23e63d3522708d98c6"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", "-trimpath", "-ldflags=#{ldflags}", "-o", bin/"delegate", "./cmd/delegate"
    system "go", "build", "-trimpath", "-ldflags=#{ldflags}", "-o", bin/"delegate-run", "./cmd/delegate-run"
  end

  test do
    assert_match "delegate #{version}", shell_output("#{bin}/delegate version")
    system bin/"delegate", "providers", "--json"
  end
end
