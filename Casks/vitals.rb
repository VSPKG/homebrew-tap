cask "vitals" do
  version "0.1.0"
  sha256 "27dc6ab985677b0ffa92e2c352eda04d3900c35bf00cc17daf67fdf970d27334"

  url "https://github.com/vineelsai26/Vitals/releases/download/v#{version}/Vitals-#{version}-macos.zip"
  name "Vitals"
  desc "Local-first macOS system monitor with Codex and Claude token activity"
  homepage "https://github.com/vineelsai26/Vitals"

  depends_on macos: :sonoma

  app "Vitals.app"

  # Vitals is an independent, locally code-signed build (not notarized), so
  # macOS quarantines the downloaded copy. Clear the flag so it launches without
  # a Gatekeeper block.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Vitals.app"]
  end

  uninstall quit: "dev.vstack.vitals"

  zap trash: [
    "~/Library/Preferences/dev.vstack.vitals.plist",
  ]

  caveats <<~EOS
    Vitals is not notarized. If the first launch is blocked, right-click
    Vitals.app and choose Open (once), or run:
      xattr -dr com.apple.quarantine "#{appdir}/Vitals.app"

    Vitals is local-only: it never reads agent credentials or sends monitoring
    data over the network.
  EOS
end
