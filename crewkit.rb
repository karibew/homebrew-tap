class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.3.1"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.3.1/crewkit-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "bb8afa626bd9f9adfa36f1b91190c62dccc4a5122a4b01a4d18c8e117cb4a0b5"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.3.1/crewkit-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "793b8eb8c1a134bae644a10102a95792dd4281f55e43a02c0cf592b4ad6735c2"

      def install
        bin.install "crewkit"
      end
    end
  end

  test do
    assert_match "crewkit", shell_output("#{bin}/crewkit --version")
  end
end
