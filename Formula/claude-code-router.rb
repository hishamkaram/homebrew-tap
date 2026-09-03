class ClaudeCodeRouter < Formula
  desc "Route Claude Code sessions to configured model providers"
  homepage "https://github.com/hishamkaram/claude-code-router"
  url "https://codeload.github.com/hishamkaram/claude-code-router/tar.gz/refs/tags/v0.4.8"
  sha256 "1b13fefa3ff688e5df8bec4077db02571bd5319da727b68e1313395799f2d4a1"
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
