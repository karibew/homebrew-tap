class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.9.29"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.9.29/crewkit-v0.9.29-aarch64-apple-darwin.tar.gz"
      sha256 "ec8c5e8e9837b6964112be2ca53ddcfa2a1eb9203fa67694f5fd249f6e8bbd3f"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.9.29/crewkit-v0.9.29-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0ed28439ec20e2a7c2a39b31f05f4c269149b41fe217d86fc1469f5fadd289fe"

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
