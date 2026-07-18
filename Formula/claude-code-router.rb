class ClaudeCodeRouter < Formula
  desc "Route Claude Code sessions to configured model providers"
  homepage "https://github.com/hishamkaram/claude-code-router"
  url "https://codeload.github.com/hishamkaram/claude-code-router/tar.gz/refs/tags/v0.1.8"
  sha256 "37404d82a0b67df6aa78f0f168e9dc72fff98ac7ca2672b09d112b5b2e9ddc08"
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
