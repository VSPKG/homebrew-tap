class Vmp < Formula
  desc "Simple Python version manager"
  homepage "https://github.com/vineelsai26/VMP"
  version "0.1.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/vineelsai26/VMP/releases/download/v0.1.2/vmp-darwin-arm64.tar.gz"
    sha256 "2f808814e8556d02772df28af3b9bfb53335bdc76b164c0d124e0f3ea843c65b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/vineelsai26/VMP/releases/download/v0.1.2/vmp-linux-x86_64.tar.gz"
    sha256 "41ea0f40802118c81f4c047ee6970f42b10bec047d0cff9edf7b31796072b687"
  end

  def install
    odie "VMP release binaries are only published for macOS ARM and Linux x86_64" if OS.mac? && Hardware::CPU.intel?
    odie "VMP release binaries are only published for macOS ARM and Linux x86_64" if OS.linux? && Hardware::CPU.arm?

    bin.install "vmp"
  end

  def caveats
    <<~EOS
      Add VMP's shell hook to your shell profile:
        eval "$(vmp env)"
    EOS
  end

  test do
    assert_match "Usage: vmp", shell_output("#{bin}/vmp help")
  end
end
