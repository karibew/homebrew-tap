class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.1.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.1.17/crewkit-v0.1.17-aarch64-apple-darwin.tar.gz"
      sha256 "2851ed7585b3a36d2345ee0e673f76416f99de83fdcb43a7fd11d5b46e13b640"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.1.17/crewkit-v0.1.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "74c8e1fe65d17de581522118210b54c9e8c8f752c812cb5d9205c6b718631502"

      def install
        bin.install "crewkit"
      end
    end
  end

  test do
    assert_match "crewkit", shell_output("#{bin}/crewkit --version")
  end
end
