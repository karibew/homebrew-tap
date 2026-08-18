class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.4.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.4.0/crewkit-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "a57f917d35bc226c270b7a97277de1aac70d18ee3175548a150c43042161a4ed"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.4.0/crewkit-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4318a0a545f3775a243c87e6e29387169373ca12222bcf70a9f3557a5eacfde6"

      def install
        bin.install "crewkit"
      end
    end
  end

  test do
    assert_match "crewkit", shell_output("#{bin}/crewkit --version")
  end
end
