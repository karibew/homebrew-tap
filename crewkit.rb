class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.1.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.1.14/crewkit-v0.1.14-aarch64-apple-darwin.tar.gz"
      sha256 "721fbe168243faf1801f3e22ad4afd733965c9d1ed9da467b8a0d74740be71eb"

      def install
        bin.install "crewkit"
      end
    end
    if Hardware::CPU.intel?
      # darwin-x64 not yet available — see release workflow
      odie "crewkit does not yet support macOS Intel. Use npm: npm install -g @crewkit/cli"
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.1.14/crewkit-v0.1.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "316e821efd24c6cc77ce24d10fd8640159380031034b6fe2b9f1b08857abb816"

      def install
        bin.install "crewkit"
      end
    end
  end

  test do
    assert_match "crewkit", shell_output("#{bin}/crewkit --version")
  end
end
