cask "powertools" do
  version "0.1.0"
  sha256 :no_check

  url "https://github.com/vineelsai26/PowerTools/releases/download/v#{version}/PowerTools-#{version}-macos.zip"
  name "PowerTools"
  desc "Utility suite with system monitoring, backups, SSH keys, and everyday tools"
  homepage "https://github.com/vineelsai26/PowerTools"

  depends_on macos: :sonoma

  app "PowerTools.app"

  # PowerTools plus every tool that can also run as its own standalone app.
  # Vitals, Downpour and Keygate keep the identifiers they shipped under
  # before they were folded into PowerTools.
  uninstall quit: [
    "dev.vstack.downpour",
    "dev.vstack.keygate",
    "dev.vstack.powertools",
    "dev.vstack.powertools.agentusage",
    "dev.vstack.powertools.audioswitcher",
    "dev.vstack.powertools.clipstack",
    "dev.vstack.powertools.colorpicker",
    "dev.vstack.powertools.keepawake",
    "dev.vstack.powertools.mousetuner",
    "dev.vstack.powertools.tweaks",
    "dev.vstack.powertools.windowsnap",
    "dev.vstack.vitals",
  ]

  zap trash: [
    "~/Library/Application Support/PowerTools",
    "~/Library/Preferences/dev.vstack.powertools.plist",
  ]

  caveats <<~EOS
    Mouse Tuner and Window Snap need Accessibility (and Input Monitoring)
    permission, granted per app in System Settings → Privacy & Security.
    Downpour additionally needs Photos and Full Disk Access.

    PowerTools now includes Vitals, Downpour and Keygate, which were previously
    separate casks. Remove the old ones with:
      brew uninstall --cask vitals downpour keygate
  EOS
end
