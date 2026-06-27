class Vmp < Formula
  desc "Simple Python version manager"
  homepage "https://github.com/vineelsai26/vmp"
  license "MIT"
  head "https://github.com/vineelsai26/vmp.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", *std_cargo_args(path: ".")
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
