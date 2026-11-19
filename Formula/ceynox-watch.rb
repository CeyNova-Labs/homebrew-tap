class CeynoxWatch < Formula
  desc "See what a command really does: programs, network, credentials touched"
  homepage "https://github.com/CeyNova-Labs/ceynox-watch"
  license "Apache-2.0"

  # The macOS archive holds one universal binary, so both architectures
  # point at the same file.
  on_macos do
    on_arm do
      url "https://github.com/CeyNova-Labs/ceynox-watch/releases/download/v0.2.3/ceynox-watch-0.2.3-macos-universal.tar.gz"
      sha256 "2ba7535e0cff52aed81a77cf1d157824acf7d2e23549ffc6751c7c23414bfaae"
    end
    on_intel do
      url "https://github.com/CeyNova-Labs/ceynox-watch/releases/download/v0.2.3/ceynox-watch-0.2.3-macos-universal.tar.gz"
      sha256 "2ba7535e0cff52aed81a77cf1d157824acf7d2e23549ffc6751c7c23414bfaae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CeyNova-Labs/ceynox-watch/releases/download/v0.2.3/ceynox-watch-0.2.3-linux-aarch64.tar.gz"
      sha256 "5b50632154896f7d4c1c036cac7a225a71ecb926b52310461b46835877d2e52c"
    end
    on_intel do
      url "https://github.com/CeyNova-Labs/ceynox-watch/releases/download/v0.2.3/ceynox-watch-0.2.3-linux-x86_64.tar.gz"
      sha256 "1c06781ee4b872f2ea75d7a4da1825a0dd838ce597f723baa952015316df1bcb"
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
