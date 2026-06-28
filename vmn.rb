class Vmn < Formula
  desc "Manage Node.js versions"
  homepage "https://vineelsai.com"
  version "0.3.5"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/vineelsai26/VMN/releases/download/v0.3.5/vmn-macos-amd64.tar.gz"
    sha256 "bacf12904c898b02a41355d3a6e8dff87c8e5abe49b7ec820722e776ff2af774"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/vineelsai26/VMN/releases/download/v0.3.5/vmn-macos-arm64.tar.gz"
    sha256 "7645ff93b53c60ec9403a6cc23236bbdd5ae83ae74770932ccea64a30cc89700"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/vineelsai26/VMN/releases/download/v0.3.5/vmn-linux-amd64.tar.gz"
    sha256 "d3d44689cc8a49d77b41a3c7326591c6f88a50d30f740a9e213d1eb3a4bc9608"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/vineelsai26/VMN/releases/download/v0.3.5/vmn-linux-arm64.tar.gz"
    sha256 "f63770426c5a9255234b1767aa60880dfc20807c6d2a6b639bd1681e99acd4fd"
  end

  def install
    bin.install "vmn"
  end

  test do
    system "#{bin}/vmn", "version"
  end
end
