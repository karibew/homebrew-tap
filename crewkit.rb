class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.1.18"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.1.18/crewkit-v0.1.18-aarch64-apple-darwin.tar.gz"
      sha256 "4d6c200d931f3e18ff3edfdce2c40e45445fc0689cddca6e680490dd5cd8863d"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.1.18/crewkit-v0.1.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b785d2cbbcd56402ec2159e343dd532ea2db36bd7f4a910d6e4e73eaab4ced76"

      def install
        bin.install "crewkit"
      end
    end
  end

  test do
    assert_match "crewkit", shell_output("#{bin}/crewkit --version")
  end
end
