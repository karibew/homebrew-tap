class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.2.4"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.2.4/crewkit-v0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "ecfec4eaa54edcc2b5d3ef4c8af83d1e68db47def21254c9d68e193b4197d120"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.2.4/crewkit-v0.2.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "526f694762fe25dd609f1b0679239e0d74e1e67bc91f40141d8e894bc59d6ec9"

      def install
        bin.install "crewkit"
      end
    end
  end

  test do
    assert_match "crewkit", shell_output("#{bin}/crewkit --version")
  end
end
