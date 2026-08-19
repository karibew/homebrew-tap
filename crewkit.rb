class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.4.1"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.4.1/crewkit-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "c7576f8697f1536b033de52d23328d5bccc074e5b7eddf8a2ef59052c07fb3db"

      def install
        bin.install "crewkit"
        generate_completions_from_executable(bin/"crewkit", "completions")
      end
    end
    if Hardware::CPU.intel?
      odie "crewkit does not yet support macOS Intel. Use npm: npm install -g @crewkit/cli"
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.4.1/crewkit-v0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "734606ba286f30b8b5417161c41031e2f5223ccc1317aadca3f1b0e4c1e85996"

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
