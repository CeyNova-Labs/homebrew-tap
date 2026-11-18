class CeynoxWatch < Formula
  desc "See what a command really does: programs, network, credentials touched"
  homepage "https://github.com/CeyNova-Labs/ceynox-watch"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/CeyNova-Labs/ceynox-watch/releases/download/v0.1.0/ceynox-watch-0.1.0-macos-universal.tar.gz"
    sha256 "f19a606c23642c3fa1fdfeb7b37091c54b44556c8572310ff57f43281afebc80"
  end

  on_linux do
    on_arm do
      url "https://github.com/CeyNova-Labs/ceynox-watch/releases/download/v0.1.0/ceynox-watch-0.1.0-linux-aarch64.tar.gz"
      sha256 "b02773021aaeceb85eaa99272182d527aba242ad34f405195dcc188531a42eb4"
    end
    on_intel do
      url "https://github.com/CeyNova-Labs/ceynox-watch/releases/download/v0.1.0/ceynox-watch-0.1.0-linux-x86_64.tar.gz"
      sha256 "3fdcba511725d7b5a5325b5fb8debb1edb78fae0fa9f0a449c7d1616437bf38a"
    end
  end

  def install
    bin.install "ceynox-watch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ceynox-watch --version")
  end
end
