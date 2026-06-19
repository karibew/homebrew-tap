class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.2.3"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.2.3/crewkit-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "b1472595b002e4ccc16e57a99ff4dfc588bf5b663d06dd9ba92a19c309246362"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.2.3/crewkit-v0.2.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "98371e64366d4b305ed159b4901bee9a8bda836072b56f81775e7772c0e42aee"

      def install
        bin.install "crewkit"
      end
    end
  end

  test do
    assert_match "crewkit", shell_output("#{bin}/crewkit --version")
  end
end
