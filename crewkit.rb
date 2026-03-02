class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.1.21"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.1.21/crewkit-v0.1.21-aarch64-apple-darwin.tar.gz"
      sha256 "36fe6f95dfea06c390c332b646700d1fa4856ede01bb6b1bf5243423823e9d99"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.1.21/crewkit-v0.1.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "998ac9f45702f4e88afaaf8a903e80ab68bf8550ed2acf1291762d1428900e41"

      def install
        bin.install "crewkit"
      end
    end
  end

  test do
    assert_match "crewkit", shell_output("#{bin}/crewkit --version")
  end
end
