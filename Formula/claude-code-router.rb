class ClaudeCodeRouter < Formula
  desc "Route Claude Code sessions to configured model providers"
  homepage "https://github.com/hishamkaram/claude-code-router"
  url "https://codeload.github.com/hishamkaram/claude-code-router/tar.gz/refs/tags/v0.1.2"
  sha256 "6d8d103b755fb8d94476bbe80ab8c669df477715ccd31b004e2502e81762d12d"
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
