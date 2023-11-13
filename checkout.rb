class Checkout < Formula
  desc "A CLI Tool to checkout your projects to you working directory"
  homepage "https://vineelsai.com"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/vineelsai26/Checkout/releases/download/v0.0.1/checkout-macos-amd64.tar.gz"
    sha256 "5ec9e3a08d7da6f51f22a1508525faf5ba4d2dfd63f0c5451a775f8a0f259477"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/vineelsai26/Checkout/releases/download/v0.0.1/checkout-macos-arm64.tar.gz"
    sha256 "dc7480ef69c1df186c653518d40c62b575947bdf148b5caa8a4cefd66b338886"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/vineelsai26/Checkout/releases/download/v0.0.1/checkout-linux-amd64.tar.gz"
    sha256 "5a1abb2f568ddc90d5b6a5de123c8dc821322f8f6e074c7a44f8add0351ebb7d"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/vineelsai26/Checkout/releases/download/v0.0.1/checkout-linux-arm64.tar.gz"
    sha256 "a9286d815ccf59c6b85c7936f49b6a68da5bd63848519fac49fc11eca3679ede"
  end

  def install
    bin.install "checkout"
  end

  test do
    system "#{bin}/checkout", "--version"
  end
end
