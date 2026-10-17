class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.7.12"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.7.12/crewkit-v0.7.12-aarch64-apple-darwin.tar.gz"
      sha256 "64e7d087c310918c8c4d5145ba0dc62abf7c97a40fc44e40cd7ed3f63f400541"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.7.12/crewkit-v0.7.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5c5b90bd45a434c6960292cd05cee785552e7620277635d6b1d93cf48b475b8a"

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
