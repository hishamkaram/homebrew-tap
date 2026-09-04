class ClaudeCodeRouter < Formula
  desc "Route Claude Code sessions to configured model providers"
  homepage "https://github.com/hishamkaram/claude-code-router"
  url "https://codeload.github.com/hishamkaram/claude-code-router/tar.gz/refs/tags/v0.4.9"
  sha256 "3987fcc8ec6770002493cd1997fdd51e19715751796243ea7901302022c710f0"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/hishamkaram/claude-code-router/internal/buildinfo.Version=#{version} -X github.com/hishamkaram/claude-code-router/internal/buildinfo.Commit=homebrew -X github.com/hishamkaram/claude-code-router/internal/buildinfo.BuiltBy=homebrew"
    system "go", "build", "-trimpath", "-ldflags=#{ldflags}", "-o", bin/"ccr", "./cmd/ccr"
  end

  test do
    assert_match "ccr #{version}", shell_output("#{bin}/ccr version")
  end
end
