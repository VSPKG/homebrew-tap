class Checkout < Formula
  desc "Check local projects out to a working directory"
  homepage "https://vineelsai.com"
  version "0.0.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/vineelsai26/Checkout/releases/download/v0.0.2/checkout-macos-amd64.tar.gz"
    sha256 "916ef8b0091592fa50cbd6d83bd5edd808f07dee36b0f6b4b0f031a25b0d1e99"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/vineelsai26/Checkout/releases/download/v0.0.2/checkout-macos-arm64.tar.gz"
    sha256 "0ffdd8580cc65417723418f319416e09d9311d4d7a024e8efe72e3109268f5bc"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/vineelsai26/Checkout/releases/download/v0.0.2/checkout-linux-amd64.tar.gz"
    sha256 "7fd1eff312cee732d82d28ce9daf2049d820ff0a1d7ca1f9f647f1a8c7a87f0b"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/vineelsai26/Checkout/releases/download/v0.0.2/checkout-linux-arm64.tar.gz"
    sha256 "e533431257c13746c1896abfa6c92554ba1dda0251701f72a29f7aef888a71b8"
  end

  def install
    bin.install "checkout"
  end

  test do
    system "#{bin}/checkout", "--version"
  end
end
