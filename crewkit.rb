class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.1.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.1.15/crewkit-v0.1.15-aarch64-apple-darwin.tar.gz"
      sha256 "38ac90592077b69d6b1d2123b7973dc4d99f5b5933a7dce2c37f5e30fccceac6"

      def install
        bin.install "crewkit"
      end
    end
    if Hardware::CPU.intel?
      odie "crewkit does not yet support macOS Intel. Use npm: npm install -g @crewkit/cli"
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.1.15/crewkit-v0.1.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "08a54a4f74254e7e0c26268e3c82528b0b58acc4ad40aa13645a012c1c5d5972"

      def install
        bin.install "crewkit"
      end
    end
  end

  test do
    assert_match "crewkit", shell_output("#{bin}/crewkit --version")
  end
end
