class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.7.5"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.7.5/crewkit-v0.7.5-aarch64-apple-darwin.tar.gz"
      sha256 "edca8883137008a5bc0a9c4ff3b370580ed163e929daadfa6152bfc3ef44b876"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.7.5/crewkit-v0.7.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8f04181c23b52f0406ab932d9c9f7b1a5f51acedff85edb7d4ab07583d1bc606"

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
