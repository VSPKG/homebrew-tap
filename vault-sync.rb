# typed: strict
# frozen_string_literal: true

# Homebrew package for the Vault Sync daemon and command-line client.
class VaultSync < Formula
  desc "End-to-end encrypted synchronization for Markdown vaults"
  homepage "https://github.com/vineelsai26/vault-sync"
  version "0.1.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/vineelsai26/vault-sync/releases/download/v0.1.0/vault-sync-macos-amd64.tar.gz"
    # Bootstrap checksum. Pin this to the first published release before installation.
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/vineelsai26/vault-sync/releases/download/v0.1.0/vault-sync-macos-arm64.tar.gz"
    # Bootstrap checksum. Pin this to the first published release before installation.
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  depends_on macos: :sonoma

  def install
    bin.install "vault-sync"
  end

  def caveats
    <<~EOS
      To run continuous synchronization as a user LaunchAgent after enrollment:
        vault-sync service install
    EOS
  end

  test do
    system "#{bin}/vault-sync", "--version"
  end
end
