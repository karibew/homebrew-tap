class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.1.22"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.1.22/crewkit-v0.1.22-aarch64-apple-darwin.tar.gz"
      sha256 "60fb00a4185f5b2fd018c597812efbf28e9f3259463baf1ad2537a2d00cd907e"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.1.22/crewkit-v0.1.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "25d343c54c5c2be381601a0817f976a5c770f0b2305cddc280d86ee530bae278"

      def install
        bin.install "crewkit"
      end
    end
  end

  test do
    assert_match "crewkit", shell_output("#{bin}/crewkit --version")
  end
end
