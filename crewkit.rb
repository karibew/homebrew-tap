class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.9.3"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.9.3/crewkit-v0.9.3-aarch64-apple-darwin.tar.gz"
      sha256 "47e9c678ce20edf7c90c279db41d4acd4144dbd68743a26fbb5a5060b29e04a9"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.9.3/crewkit-v0.9.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c0be2e4e4c1ce2a1f1007a4ecc2043ed2ab2333de1687b377d0e35e5ab9b2ae"

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
