class CeynoxWatch < Formula
  desc "See what a command really does: programs, network, credentials touched"
  homepage "https://github.com/CeyNova-Labs/ceynox-watch"
  license "Apache-2.0"

  # The macOS archive holds one universal binary, so both architectures
  # point at the same file.
  on_macos do
    on_arm do
      url "https://github.com/CeyNova-Labs/ceynox-watch/releases/download/v0.2.4/ceynox-watch-0.2.4-macos-universal.tar.gz"
      sha256 "777da77c092380f8a650cb8d4e0a5f66154a47947b835f3c3749277c19ba0f87"
    end
    on_intel do
      url "https://github.com/CeyNova-Labs/ceynox-watch/releases/download/v0.2.4/ceynox-watch-0.2.4-macos-universal.tar.gz"
      sha256 "777da77c092380f8a650cb8d4e0a5f66154a47947b835f3c3749277c19ba0f87"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CeyNova-Labs/ceynox-watch/releases/download/v0.2.4/ceynox-watch-0.2.4-linux-aarch64.tar.gz"
      sha256 "7ab4de7bff5db814d1397f6f717cdbefd0a89fc8fd661e6481350554a5393856"
    end
    on_intel do
      url "https://github.com/CeyNova-Labs/ceynox-watch/releases/download/v0.2.4/ceynox-watch-0.2.4-linux-x86_64.tar.gz"
      sha256 "3ef2a392e3fbbecb4f00a658d4389c49070b713deab2b370a93be1d2e5481f7b"
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
