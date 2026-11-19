class CeynoxWatch < Formula
  desc "See what a command really does: programs, network, credentials touched"
  homepage "https://github.com/CeyNova-Labs/ceynox-watch"
  license "Apache-2.0"

  # The macOS archive holds one universal binary, so both architectures
  # point at the same file.
  on_macos do
    on_arm do
      url "https://github.com/CeyNova-Labs/ceynox-watch/releases/download/v0.2.1/ceynox-watch-0.2.1-macos-universal.tar.gz"
      sha256 "2dd1a31b78208d49188fcd7b173ce008410a9a9c4fccba7592ab1749f07d7f7d"
    end
    on_intel do
      url "https://github.com/CeyNova-Labs/ceynox-watch/releases/download/v0.2.1/ceynox-watch-0.2.1-macos-universal.tar.gz"
      sha256 "2dd1a31b78208d49188fcd7b173ce008410a9a9c4fccba7592ab1749f07d7f7d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CeyNova-Labs/ceynox-watch/releases/download/v0.2.1/ceynox-watch-0.2.1-linux-aarch64.tar.gz"
      sha256 "d29ec2039fcd849fe3a2279ab2b5ce96105c8a11fafb016922aaa15c585ad9ba"
    end
    on_intel do
      url "https://github.com/CeyNova-Labs/ceynox-watch/releases/download/v0.2.1/ceynox-watch-0.2.1-linux-x86_64.tar.gz"
      sha256 "b53751139be185afa5fd008a46b29c2b39a3a9523e8ff853f92daaa101d5a516"
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
