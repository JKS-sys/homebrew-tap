# homebrew-tap

Homebrew tap for Jagadeesh Kumar S's software.

```sh
brew install jks-sys/tap/pour          # Pour — the Homebrew-compatible package manager that installs in milliseconds
pour init                              # creates /opt/pour and prints the one shell line to add

brew install --cask jks-sys/tap/keel   # Keel — AI terminal that shows at a glance which commands worked
```

| | What | Where |
|---|---|---|
| `Formula/pour.rb` | Pour 0.1.0 — macOS (Apple Silicon, Intel) and Linux (x86_64, arm64) builds, SHA-256 pinned, `livecheck` on the release feed | [ipconfig.co.network/pour](https://ipconfig.co.network/pour) · [source](https://github.com/JKS-sys/pour) |
| `Casks/keel.rb` | Keel | [ipconfig.co.network/keel](https://ipconfig.co.network/keel) |

Pour installs the same formulae and casks as Homebrew, from the same bottles, into its own prefix `/opt/pour`, so it sits next to Homebrew without touching it. Every app in this tap is also one `pour install <name>` away on macOS, Windows, Linux and FreeBSD.
