# Homebrew Tap

Homebrew packages for projects maintained by Hesham Karm.

## Install Delegation Layer

```bash
brew install hishamkaram/tap/delegation-layer
```

The `delegation-layer` formula installs the prebuilt `delegate` and
`delegate-run` CLIs from a stable release archive and installs `pueue` as its
runtime supervisor dependency. Each platform archive is pinned with a SHA256
checksum. The Delegation Layer release promotion workflow updates the formula
automatically for every promoted stable release.

## Install CCR

```bash
brew install hishamkaram/tap/claude-code-router
```

The `claude-code-router` formula is generated from tagged releases of
[`hishamkaram/claude-code-router`](https://github.com/hishamkaram/claude-code-router).
It builds the `ccr` CLI from the tagged source archive with Homebrew's Go toolchain.

For release archives and installation on Linux, see the
[CCR release page](https://github.com/hishamkaram/claude-code-router/releases).
