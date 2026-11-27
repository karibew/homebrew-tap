class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.9.31"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.9.31/crewkit-v0.9.31-aarch64-apple-darwin.tar.gz"
      sha256 "97ddc079f77bffca3fb2c66b5952d18576bacd970f4899d2b4516368164e99cf"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.9.31/crewkit-v0.9.31-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b00c18c9d68ca8f6b9cfb8eebc491adb598c585d7b2bf09421f880b14c343d58"

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
