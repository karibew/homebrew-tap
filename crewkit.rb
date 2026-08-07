class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.2.6"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.2.6/crewkit-v0.2.6-aarch64-apple-darwin.tar.gz"
      sha256 "f5ab531101d336c2af8c0df98e5fbaf986e9258b0ab769e1f903b8826d64bcd2"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.2.6/crewkit-v0.2.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "553dddb63c9350fa98723ae37825e80e328ec5d79f465de76c57fff44d83eecf"

      def install
        bin.install "crewkit"
      end
    end
  end

  test do
    assert_match "crewkit", shell_output("#{bin}/crewkit --version")
  end
end
