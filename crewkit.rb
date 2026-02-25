class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.1.19"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.1.19/crewkit-v0.1.19-aarch64-apple-darwin.tar.gz"
      sha256 "e3b71c06ee0eefb9c7c6c8012306e92e46314023d5be9e910ce9720dd99a9320"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.1.19/crewkit-v0.1.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "db72ab19ea9f058bebd5a3e855576e3b5a931dcb277fcb4753326510d764c12d"

      def install
        bin.install "crewkit"
      end
    end
  end

  test do
    assert_match "crewkit", shell_output("#{bin}/crewkit --version")
  end
end
