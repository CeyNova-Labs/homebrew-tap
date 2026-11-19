class CeynoxWatch < Formula
  desc "See what a command really does: programs, network, credentials touched"
  homepage "https://github.com/CeyNova-Labs/ceynox-watch"
  license "Apache-2.0"

  # The macOS archive holds one universal binary, so both architectures
  # point at the same file.
  on_macos do
    on_arm do
      url "https://github.com/CeyNova-Labs/ceynox-watch/releases/download/v0.2.2/ceynox-watch-0.2.2-macos-universal.tar.gz"
      sha256 "4e713e461c152470123f88515aba5ab16b4769becfdfea9f89d5efd9da0ebfe4"
    end
    on_intel do
      url "https://github.com/CeyNova-Labs/ceynox-watch/releases/download/v0.2.2/ceynox-watch-0.2.2-macos-universal.tar.gz"
      sha256 "4e713e461c152470123f88515aba5ab16b4769becfdfea9f89d5efd9da0ebfe4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CeyNova-Labs/ceynox-watch/releases/download/v0.2.2/ceynox-watch-0.2.2-linux-aarch64.tar.gz"
      sha256 "d457ba0d9bc5fd4e9821dc77b5d247c11406ca20266c447b0a5a63e3802a8a2e"
    end
    on_intel do
      url "https://github.com/CeyNova-Labs/ceynox-watch/releases/download/v0.2.2/ceynox-watch-0.2.2-linux-x86_64.tar.gz"
      sha256 "23f74c9bd5d8a022f921686954b564bf01b772767ea0af990570a37db077239f"
    end
  end

  def install
    bin.install "ceynox-watch"
    # On macOS, the Linux builds that --inspect runs inside its container.
    libexec.install Dir["libexec/*"] if Dir.exist?("libexec")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ceynox-watch --version")
  end
end
