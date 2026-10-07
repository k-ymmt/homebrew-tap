class Apvt < Formula
  desc "Shows an AI agent what an iOS Simulator app's views look like"
  homepage "https://github.com/k-ymmt/apvt"
  url "https://github.com/k-ymmt/apvt/releases/download/v0.1.0/apvt-macos.tar.gz"
  sha256 "14123f9001823875de7ca34d6f694fe5f41879b2e06845b00038e93c46c28146"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on macos: :sequoia

  def install
    bin.install "apvt"
  end

  def caveats
    <<~EOS
      apvt builds its in-app agent with Xcode on first use: it needs Xcode with the
      iOS Simulator platform and Swift 6.2 or later (`xcrun --sdk iphonesimulator swiftc --version`).
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/apvt --version").strip
  end
end
