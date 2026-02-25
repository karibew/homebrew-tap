class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.1.20"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.1.20/crewkit-v0.1.20-aarch64-apple-darwin.tar.gz"
      sha256 "fadd4a6625488b96c3b7b3235c48e02cb3db25ab7c249123d49f988025aaee24"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.1.20/crewkit-v0.1.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "410b4a1407333514d7c6510c9a068dbc48450adc3dc8fc890b2616aeed0eba98"

      def install
        bin.install "crewkit"
      end
    end
  end

  test do
    assert_match "crewkit", shell_output("#{bin}/crewkit --version")
  end
end
