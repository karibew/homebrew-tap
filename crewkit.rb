class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.3.4"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.3.4/crewkit-v0.3.4-aarch64-apple-darwin.tar.gz"
      sha256 "9af9a13dbf938dccc5b2487270754b2c10d429d918443bc5a4c46d5aca987f1a"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.3.4/crewkit-v0.3.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "52debf3ac87d1b6a26576c7b768794d585c3a3bd9de0d5552daa544ab95f84e0"

      def install
        bin.install "crewkit"
      end
    end
  end

  test do
    assert_match "crewkit", shell_output("#{bin}/crewkit --version")
  end
end
