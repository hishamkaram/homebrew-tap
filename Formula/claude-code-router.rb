class ClaudeCodeRouter < Formula
  desc "Route Claude Code sessions to configured model providers"
  homepage "https://github.com/hishamkaram/claude-code-router"
  url "https://codeload.github.com/hishamkaram/claude-code-router/tar.gz/refs/tags/v0.2.2"
  sha256 "2239c880a93d3ddfe9fd27800b4851c9203be33ed0fbe06faa507b5a38359f05"
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
