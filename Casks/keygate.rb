cask "keygate" do
  version "0.1.1"
  sha256 "f6848f5bc3ced37b21c988e4216688e109e125b93da46c6c86da8ef456a0dcd2"

  url "https://github.com/vineelsai26/Keygate/releases/download/v#{version}/Keygate-#{version}-macos.zip"
  name "Keygate"
  desc "SSH key manager and agent"
  homepage "https://github.com/vineelsai26/Keygate"

  deprecate! date:             "2026-08-25",
             because:          "is included in PowerTools",
             replacement_cask: "powertools"

  depends_on macos: :sonoma

  app "Keygate.app"

  uninstall quit: "dev.vstack.keygate"
end
