cask "keygate" do
  version "0.1.1"
  sha256 "f6848f5bc3ced37b21c988e4216688e109e125b93da46c6c86da8ef456a0dcd2"

  url "https://github.com/vineelsai26/Keygate/releases/download/v#{version}/Keygate-#{version}-macos.zip"
  name "Keygate"
  desc "Native SSH key manager with Touch ID and an OpenSSH agent"
  homepage "https://github.com/vineelsai26/Keygate"

  depends_on macos: :sonoma

  app "Keygate.app"
  binary "#{appdir}/Keygate.app/Contents/MacOS/keygate"

  # Keygate is an independent, locally code-signed build (not notarized), so
  # macOS quarantines the downloaded copy. Clear the flag so it launches without
  # a Gatekeeper block.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Keygate.app"]
  end

  uninstall quit: "dev.vstack.keygate"

  zap trash: [
    "~/Library/Application Support/Keygate",
    "~/Library/Preferences/dev.vstack.keygate.plist",
  ]

  caveats <<~EOS
    Keygate is not notarized. If the first launch is blocked, right-click
    Keygate.app and choose Open (once), or run:
      xattr -dr com.apple.quarantine "#{appdir}/Keygate.app"

    Point SSH at the agent socket after launch, for example:
      export SSH_AUTH_SOCK="/tmp/keygate-$(id -u)/agent.sock"
  EOS
end
