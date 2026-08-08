cask "powertools" do
  version "0.1.0"
  sha256 :no_check

  url "https://github.com/vineelsai26/PowerTools/releases/download/v#{version}/PowerTools-#{version}-macos.zip"
  name "PowerTools"
  desc "Quality-of-life macOS tweaks: keep-awake, window snapping, clipboard, mouse tuning"
  homepage "https://github.com/vineelsai26/PowerTools"

  depends_on macos: :sonoma

  app "PowerTools.app"

  # PowerTools is an independent, locally code-signed build (not notarized), so
  # macOS quarantines the downloaded copy. Clear the flag so it launches without
  # a Gatekeeper block.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/PowerTools.app"]
  end

  uninstall quit: [
    "dev.vstack.powertools",
    "dev.vstack.powertools.keepawake",
    "dev.vstack.powertools.windowsnap",
    "dev.vstack.powertools.clipstack",
    "dev.vstack.powertools.mousetuner",
    "dev.vstack.powertools.tweaks",
  ]

  zap trash: [
    "~/Library/Application Support/PowerTools",
    "~/Library/Preferences/dev.vstack.powertools.plist",
  ]

  caveats <<~EOS
    PowerTools is not notarized. If the first launch is blocked, right-click
    PowerTools.app and choose Open (once), or run:
      xattr -dr com.apple.quarantine "#{appdir}/PowerTools.app"

    Mouse Tuner and Window Snap need Accessibility (and Input Monitoring)
    permission, granted per app in System Settings → Privacy & Security.
  EOS
end
