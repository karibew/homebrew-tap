class Crewkit < Formula
  desc "Observability and governance for AI-assisted engineering teams"
  homepage "https://crewkit.io"
  version "0.7.8"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.7.8/crewkit-v0.7.8-aarch64-apple-darwin.tar.gz"
      sha256 "f0ad69a94017b5a7b92da97d1807af72faf05206ee7d3d80f51ca8b03a550bb0"

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
      url "https://github.com/karibew/crewkit-cli/releases/download/v0.7.8/crewkit-v0.7.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2e0f326c03cd15cc5fd01b907aa8b4566b67a8f47f9c03b0660c455cacaaa222"

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
