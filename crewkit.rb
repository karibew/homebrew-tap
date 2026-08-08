class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.3.2"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.3.2/crewkit-v0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "5b2fc96ab63417371a5eaa34f0000a8c5e47d64f12a66b95f7a44e0dbfd385a2"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.3.2/crewkit-v0.3.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e74d376b7b52d6b45a7a0762346ab12377ee1a728c64e59064971aad50a3b8e3"

      def install
        bin.install "crewkit"
      end
    end
  end

  test do
    assert_match "crewkit", shell_output("#{bin}/crewkit --version")
  end
end
