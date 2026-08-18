class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.3.5"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.3.5/crewkit-v0.3.5-aarch64-apple-darwin.tar.gz"
      sha256 "58e858737ff504a0b4f388e4696a0c3e5a87bbf9fa132f87ae0f1f4a90c6f8cc"

      def install
        bin.install "crewkit"
      end
    end
    if Hardware::CPU.intel?
      odie "crewkit does not yet support macOS Intel. Use npm: npm install -g @crewkit/cli"
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.3.5/crewkit-v0.3.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "82c425744b509fb0acb3e36ec4e2302a1e4986763e1e10aee71b39078c40e045"

      def install
        bin.install "crewkit"
      end
    end
  end

  test do
    assert_match "crewkit", shell_output("#{bin}/crewkit --version")
  end
end
