class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.5.3"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.5.3/crewkit-v0.5.3-aarch64-apple-darwin.tar.gz"
      sha256 "0c806e1bcb39c6560664af68693d3243afa8deea9acbaea6a11caa546c245e47"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.5.3/crewkit-v0.5.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "64b3940c6b61d84bf9b2d51e26fa2e0c3a2dfc2c8ef2b7e39785740161d8b7ba"

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
