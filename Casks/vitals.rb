cask "vitals" do
  version "0.1.0"
  sha256 "27dc6ab985677b0ffa92e2c352eda04d3900c35bf00cc17daf67fdf970d27334"

  url "https://github.com/vineelsai26/Vitals/releases/download/v#{version}/Vitals-#{version}-macos.zip"
  name "Vitals"
  desc "Local-first system monitor"
  homepage "https://github.com/vineelsai26/Vitals"

  deprecate! date:             "2026-08-25",
             because:          "is included in PowerTools",
             replacement_cask: "powertools"

  depends_on macos: :sonoma

  app "Vitals.app"

  uninstall quit: "dev.vstack.vitals"
end
