class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.1.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.1.16/crewkit-v0.1.16-aarch64-apple-darwin.tar.gz"
      sha256 "8a491cfd948936c18a7eeff1983346aef1ffc01e596325b37e179efa35932dba"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.1.16/crewkit-v0.1.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8167d17b8fca0e0010a0974018377269f4baf34bfeac61124f69b384f3b60bc1"

      def install
        bin.install "crewkit"
      end
    end
  end

  test do
    assert_match "crewkit", shell_output("#{bin}/crewkit --version")
  end
end
