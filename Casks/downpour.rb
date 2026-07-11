cask "downpour" do
  version "0.1.1"
  sha256 "e5ea42eb490faaceed3870ff2f6ef30cbd7264fbd74a18a372077b67b95fceb3"

  url "https://github.com/vineelsai26/Downpour/releases/download/v#{version}/Downpour-#{version}-macos.zip"
  name "Downpour"
  desc "Back up iCloud Drive and Photos to an external disk with snapshots"
  homepage "https://github.com/vineelsai26/Downpour"

  depends_on macos: :sonoma

  app "Downpour.app"
  binary "downpour"

  # Downpour is an independent, locally code-signed build (not notarized), so
  # macOS quarantines the downloaded copy. Clear the flag so it launches without
  # a Gatekeeper block.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Downpour.app"]
  end

  uninstall quit: "dev.vstack.downpour"

  zap trash: [
    "~/Library/LaunchAgents/dev.vstack.downpour.plist",
    "~/Library/Logs/Downpour",
    "~/Library/Preferences/dev.vstack.downpour.plist",
  ]

  caveats <<~EOS
    Downpour is not notarized. If the first launch is blocked, right-click
    Downpour.app and choose Open (once), or run:
      xattr -dr com.apple.quarantine "#{appdir}/Downpour.app"

    Grant on first run:
      - Full Disk Access     to read the iCloud Drive mirror
      - Photos (Full Access) to back up your photo library

    Downpour is not affiliated with or endorsed by Apple.
  EOS
end
