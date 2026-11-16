class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.9.17"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.9.17/crewkit-v0.9.17-aarch64-apple-darwin.tar.gz"
      sha256 "31e83e17fa89b7a2a62576414f6114d8a9b58972ce1c69f90f998783fd8a497c"

      def install
        bin.install "crewkit"
        generate_completions_from_executable(bin/"crewkit", "completions")
      end
    end
    if Hardware::CPU.intel?
      odie "crewkit does not publish a macOS Intel (x86_64) build. Supported: Apple Silicon, Linux x64, and WSL."
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.9.17/crewkit-v0.9.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "84167b6d9e055a44ac45c85c96993ac80498651be5145e3c6ecd86a55cfc1230"

      def install
        bin.install "crewkit"
        generate_completions_from_executable(bin/"crewkit", "completions")
      end
    end
  end

  test do
    assert_match "crewkit", shell_output("#{bin}/crewkit --version")
  end
end
