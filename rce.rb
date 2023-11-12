class RCE < Formula
  desc "A API to run code remotely"
  homepage "https://vineelsai.com"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/vineelsai26/RCE/releases/download/v1.5.0/rce-macos-amd64.tar.gz"
    sha256 "0b49a11f073a8bd1281864b4e3740e58b0a3055f38301b107f07e948385a51e7"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/vineelsai26/RCE/releases/download/v1.5.0/rce-macos-arm64.tar.gz"
    sha256 "b3ec5665818878f5744dd2c6712c98193f96960dd8ca10468865998e5eab32d5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/vineelsai26/RCE/releases/download/v1.5.0/rce-linux-amd64.tar.gz"
    sha256 "d291cf1cca08367adafa64508a74ce562e066b822d7d7f6098ed7cf31f0945d3"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/vineelsai26/RCE/releases/download/v1.5.0/rce-linux-arm64.tar.gz"
    sha256 "2b47702d99b9b918a3e317378967499c3202dada71be48b5f7ca18aa2fd1576f"
  end

  def install
    bin.install "rce"
  end

  test do
    system "#{bin}/rce", "--version"
  end
end
