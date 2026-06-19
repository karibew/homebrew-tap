class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.2.1"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.2.1/crewkit-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "bab2616da86393258accedf590e79d850b3e45b8d1c2d70186d989a0930f6606"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.2.1/crewkit-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cf8250083c347890ae123518582cf16f802d4b249e3a4e0ba9d9fc87d698ad18"

      def install
        bin.install "crewkit"
      end
    end
  end

  test do
    assert_match "crewkit", shell_output("#{bin}/crewkit --version")
  end
end
