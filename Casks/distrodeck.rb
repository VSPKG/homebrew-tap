cask "distrodeck" do
  version "0.1.0"
  sha256 :no_check

  url "https://github.com/vineelsai26/DistroDeck/releases/download/v#{version}/DistroDeck-#{version}-macOS-arm64.zip"
  name "DistroDeck"
  desc "Persistent Ubuntu, Fedora, and Arch environments using Apple Container"
  homepage "https://github.com/vineelsai26/DistroDeck"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "DistroDeck.app"
  binary "#{appdir}/DistroDeck.app/Contents/MacOS/distrodeck"

  uninstall launchctl: "dev.vstack.distrodeck.bridge",
            quit:      [
              "dev.vstack.distrodeck",
              "dev.vstack.distrodeck.arch",
              "dev.vstack.distrodeck.fedora",
              "dev.vstack.distrodeck.ubuntu",
            ]

  zap trash: [
    "~/Library/Application Support/DistroDeck",
    "~/Library/LaunchAgents/dev.vstack.distrodeck.bridge.plist",
  ]

  caveats <<~EOS
    DistroDeck requires Apple's Container runtime with `container machine`
    support. Install it from:
      https://github.com/apple/container/releases

    Distro launchers and Linux machine data are created only when you install a
    distribution. Removing the cask does not delete those machines or their data.
  EOS
end
