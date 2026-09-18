class DelegationLayer < Formula
  desc "Durable supervised delegation for supported AI CLIs"
  homepage "https://github.com/hishamkaram/delegation-layer"
  url "https://codeload.github.com/hishamkaram/delegation-layer/tar.gz/refs/tags/v0.1.2"
  sha256 "cce47ac8bc294d5cad9f160bbe0a3ff9adbad3d66e5a5baa53756510210670fe"
  license "MIT"

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
