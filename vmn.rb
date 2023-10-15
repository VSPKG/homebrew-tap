class Vmn < Formula
  desc "A CLI tool to manage your node and python versions"
  homepage ""
  url "https://github.com/vineelsai26/VMN/releases/download/v0.2.2/vmn-macos-arm64.tar.gz"
  sha256 "9d08bb80ab13bf7184e4ab5be93b7a447a596d1ce1b11c633eedad3395cae3f4"
  license "MIT"

  def install
    bin.install "vmn"
  end

  test do
    system "#{bin}/vmn", "--version"
  end
end
