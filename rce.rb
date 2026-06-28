class Rce < Formula
  desc "Run code remotely through an API"
  homepage "https://vineelsai.com"
  version "1.5.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/vineelsai26/RCE/releases/download/v1.5.1/rce-macos-amd64.tar.gz"
    sha256 "774cd6879d4350f3a7096cedc3487857914c8485a6e271ef857bac50bacca708"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/vineelsai26/RCE/releases/download/v1.5.1/rce-macos-arm64.tar.gz"
    sha256 "05ceca7e48838a776865b3f52feb20a8f0aa26567dda0e2602a65ccbd649783c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/vineelsai26/RCE/releases/download/v1.5.1/rce-linux-amd64.tar.gz"
    sha256 "716dcd59bda6a8fc464d04bf6ebe68b2215e0aafb9ae73b1aa5a7feceedf2755"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/vineelsai26/RCE/releases/download/v1.5.1/rce-linux-arm64.tar.gz"
    sha256 "a95b47a16b79d487fadf3f2cc42dd047dac8e8c998d46eb90c0adb811c80159e"
  end

  def install
    bin.install "rce"
  end

  test do
    system "#{bin}/rce", "--version"
  end
end
