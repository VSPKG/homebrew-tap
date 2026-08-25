# typed: strict
# frozen_string_literal: true

# Homebrew package for the Relay command-line proxy.
class Relay < Formula
  desc "Named localhost reverse proxy for development servers"
  homepage "https://github.com/vineelsai26/Relay"
  version "1.0.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/vineelsai26/Relay/releases/download/v1.0.0/relay-macos-amd64.tar.gz"
    # Bootstrap checksum. Pin this to the first published release before installation.
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/vineelsai26/Relay/releases/download/v1.0.0/relay-macos-arm64.tar.gz"
    # Bootstrap checksum. Pin this to the first published release before installation.
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  depends_on macos: :sonoma

  def install
    bin.install "relay"
  end

  test do
    system "#{bin}/relay", "--version"
  end
end
