class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.8.3"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.8.3/crewkit-v0.8.3-aarch64-apple-darwin.tar.gz"
      sha256 "0c8eee72c38bf6759391074c9b5b35419911aa238cd38c4c85573f495a5e7808"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.8.3/crewkit-v0.8.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cef8287cb1feb8b3ddd2c40bab8a86ee3a0e5a3b2ffd03ff29fced383f7be1de"

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
