# VSPKG Homebrew Tap

Homebrew formulae and casks for Vineel's tools and apps.

> This repository is an automatically published mirror. The source of truth lives
> in a private monorepo and is synced here on every change — please file issues or
> changes upstream rather than opening pull requests against this repository.

## Install

```sh
brew tap vspkg/tap https://github.com/VSPKG/homebrew-tap.git
```

Then install any of:

```sh
brew install vspkg/tap/vmn       # Node.js version manager (release binaries)
brew install vspkg/tap/vmp       # Python version manager (release binaries)
brew install vspkg/tap/checkout  # project checkout CLI
brew install vspkg/tap/rce       # remote code execution API
brew install vspkg/tap/relay     # named localhost reverse proxy
brew install vspkg/tap/vault-sync # encrypted vault synchronization
brew install --cask vspkg/tap/powertools  # macOS utility suite (macOS)
brew install --cask vspkg/tap/distrodeck  # Apple Container Linux manager (Apple silicon)
```

`powertools` bundles what used to ship as the separate `downpour`, `keygate` and
`vitals` casks: system monitoring, iCloud Drive / Photos backup, and the SSH key
manager and agent, alongside the rest of the PowerTools utilities. The old casks
remain available for migration but are deprecated and point users to PowerTools.

PowerTools and DistroDeck casks use bootstrap checksums until their first
notarized releases are published. Relay and Vault Sync formulae use placeholder
checksums until their first tagged macOS archives are published. Release work
must replace those values with the exact archive SHA-256 before announcing the
install commands as live.

## Contents

| Item | Type | Upstream |
| --- | --- | --- |
| `vmn` | formula | https://github.com/vineelsai26/vmn |
| `vmp` | formula | https://github.com/vineelsai26/vmp |
| `checkout` | formula | https://github.com/vineelsai26/Checkout |
| `rce` | formula | https://github.com/vineelsai26/RCE |
| `relay` | formula | https://github.com/vineelsai26/Relay |
| `vault-sync` | formula | https://github.com/vineelsai26/vault-sync |
| `powertools` | cask | https://github.com/vineelsai26/PowerTools |
| `distrodeck` | cask | https://github.com/vineelsai26/DistroDeck |
| `downpour` | deprecated cask | Replaced by `powertools` |
| `keygate` | deprecated cask | Replaced by `powertools` |
| `vitals` | deprecated cask | Replaced by `powertools` |
