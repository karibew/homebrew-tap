# typed: strict
# frozen_string_literal: true

# Releases are published from the public karibew/argus-cli, so this formula is
# plain URLs and checksums: no download strategy, no token (docs/adr/0008).
class Argus < Formula
  desc "Security review toolkit and pre-deploy gate"
  homepage "https://github.com/karibew/argus-cli"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/argus-cli/releases/download/v0.4.0/argus-darwin-arm64"
      sha256 "774ecc2ac0dcb2ce96a7339fc9429e8cf5646d6189733eeebe8da23fe80964c8"
    else
      url "https://github.com/karibew/argus-cli/releases/download/v0.4.0/argus-darwin-amd64"
      sha256 "05720557e09f06d6868855aa51610633a0a45d29c4f7a2c44a96448680457c93"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/argus-cli/releases/download/v0.4.0/argus-linux-arm64"
      sha256 "7de6d602b629eb6e2481ab5e6f55dd6a52ddc22d7ffa5925d620957fd17cd699"
    else
      url "https://github.com/karibew/argus-cli/releases/download/v0.4.0/argus-linux-amd64"
      sha256 "50ef38a45c7333d6d356e2afea6f8c8f70df1292397083c4c4d55ada520f825e"
    end
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "argus-#{os}-#{arch}" => "argus"
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/argus version")
  end
end
