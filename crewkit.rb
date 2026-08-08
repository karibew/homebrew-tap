class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.3.3"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.3.3/crewkit-v0.3.3-aarch64-apple-darwin.tar.gz"
      sha256 "22671f898f6c084825e81739909dfb61770dc8a60fde76713d6c3f0bcd2e907b"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.3.3/crewkit-v0.3.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e7d431768004e13c854ff42b790d1d22749f397a6c88e668a18bdf0f96ecde07"

      def install
        bin.install "crewkit"
      end
    end
  end

  test do
    assert_match "crewkit", shell_output("#{bin}/crewkit --version")
  end
end
