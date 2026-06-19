class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.2.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.2.0/crewkit-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "9f8b359cf695717995a5c69afaac4dc354b5218f21655e8579d5a3730433c9ce"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.2.0/crewkit-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f8a42b493c8c12df467725b737e210cb47696a025403e33a678412a68c52ef41"

      def install
        bin.install "crewkit"
      end
    end
  end

  test do
    assert_match "crewkit", shell_output("#{bin}/crewkit --version")
  end
end
