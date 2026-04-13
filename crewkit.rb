class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.1.23"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.1.23/crewkit-v0.1.23-aarch64-apple-darwin.tar.gz"
      sha256 "da326f912cc334de9573b9e38d943728ed8b999ab8f1b58c32aa82a0903d4a45"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.1.23/crewkit-v0.1.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f045e6b6602df98d586221966a0794dd788d90def03b56ed0d023cd3d35cd67b"

      def install
        bin.install "crewkit"
      end
    end
  end

  test do
    assert_match "crewkit", shell_output("#{bin}/crewkit --version")
  end
end
