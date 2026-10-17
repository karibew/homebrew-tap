class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.7.13"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.7.13/crewkit-v0.7.13-aarch64-apple-darwin.tar.gz"
      sha256 "ec296f00172359175183c90be0912fadbd489c21ad18c7a46f4aa0e9cec6abe6"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.7.13/crewkit-v0.7.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "503d9931a17db4b7ea2b3c9cfb6ea9804bd5de23c48fa7bd32fa963776681b2f"

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
