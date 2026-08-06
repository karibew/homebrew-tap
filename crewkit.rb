class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.2.5"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.2.5/crewkit-v0.2.5-aarch64-apple-darwin.tar.gz"
      sha256 "1b736d0b9f75ffb1795d6908518daef7d6676a915469f738e160d0df4b06124a"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.2.5/crewkit-v0.2.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "30d400dd359ca275ce0219364115c0a985d20a70b7d8dbc97b06148e2981e869"

      def install
        bin.install "crewkit"
      end
    end
  end

  test do
    assert_match "crewkit", shell_output("#{bin}/crewkit --version")
  end
end
