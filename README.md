# homebrew-tap — retired

The Homebrew formulae and casks that lived here have been removed. Everything Jagadeesh Kumar S makes now installs with **[Pour](https://ipconfig.co.network/pour)**, his own package manager — one command for Pour itself, one for each app, on macOS, Linux, ChromeOS, Windows and FreeBSD.

```sh
curl -fsSL https://ipconfig.co.network/pour/install | sh   # Pour itself (macOS, Linux, ChromeOS, FreeBSD, WSL)
pour install keel                                           # then any app: peek · voxo · nib · keel · swep · grab · dial · mend · twig · cine · veil
```

Windows (PowerShell):

```powershell
irm https://ipconfig.co.network/pour/dl/pour-windows-x86_64.exe -OutFile $env:LOCALAPPDATA\pour.exe
& $env:LOCALAPPDATA\pour.exe install keel
```

Already tapped? Untap it so `brew update` stops fetching this repository:

```sh
brew uninstall jks-sys/tap/pour 2>/dev/null; brew uninstall --cask jks-sys/tap/keel 2>/dev/null
brew untap jks-sys/tap
```

| | |
|---|---|
| Pour | [ipconfig.co.network/pour](https://ipconfig.co.network/pour) · [source](https://github.com/JKS-sys/pour-13-Oct-2026) |
| The apps | [ipconfig.co.network](https://ipconfig.co.network) — each app page shows its `pour install` line |

Copyright © 2026 Jagadeesh Kumar S. All rights reserved.
