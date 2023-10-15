class Vmn < Formula
  desc "A CLI tool to manage your node and python versions"
  homepage "https://vineelsai.com"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/vineelsai26/VMN/releases/download/v0.2.2/vmn-macos-amd64.tar.gz"
    sha256 "c340d4609849eb144b7366c2f689bd5b3bba4d8dec6d0f3fcca58057c3e92c8d"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/vineelsai26/VMN/releases/download/v0.2.2/vmn-macos-arm64.tar.gz"
    sha256 "9d08bb80ab13bf7184e4ab5be93b7a447a596d1ce1b11c633eedad3395cae3f4"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/vineelsai26/VMN/releases/download/v0.2.2/vmn-linux-amd64.tar.gz"
    sha256 "cc0f8753b9cde34dd1ceec39b9087a72e7922551c9f9e3291af86e001f60de4a"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/vineelsai26/VMN/releases/download/v0.2.2/vmn-linux-arm64.tar.gz"
    sha256 "eabe1f3fcf119ee45dc5d49881e2f0a779c74baf166a0c9e0f9fe594a4e95d11"
  end

  def install
    bin.install "vmn"
  end

  test do
    system "#{bin}/vmn", "--version"
  end
end
