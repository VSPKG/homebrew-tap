class VMN < Formula
  desc "A CLI tool to manage your node and python versions"
  homepage "https://vineelsai.com"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/vineelsai26/VMN/releases/download/v0.2.3/vmn-macos-amd64.tar.gz"
    sha256 "b8d177837d709ae082ce7cde396122721581a1146316befa44ecd4771c693266"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/vineelsai26/VMN/releases/download/v0.2.3/vmn-macos-arm64.tar.gz"
    sha256 "0ff268f0d13e95cf784eb877e6dca03ac27667c9cc156b55f5f8b65d02ae7957"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/vineelsai26/VMN/releases/download/v0.2.3/vmn-linux-amd64.tar.gz"
    sha256 "24dfa8ed8803ee90afe2c3a9b1707a139d89950f692d7d50742db07315fee9d7"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/vineelsai26/VMN/releases/download/v0.2.3/vmn-linux-arm64.tar.gz"
    sha256 "c14d5cbb610a0447285e7cf50b8285700d3d0a6d2400e01807f5d30b6718efee"
  end

  def install
    bin.install "vmn"
  end

  test do
    system "#{bin}/vmn", "--version"
  end
end
