class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.8.1"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.8.1/crewkit-v0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "30615d9a69169a3e17af7c63d7a0e1ef4e0354086ee60a2a6caf3c3eb6766b17"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.8.1/crewkit-v0.8.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f2433e2d53324b45869c2f0c80c293da59abb504079bd3f3c390b48a4bc15fa6"

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
