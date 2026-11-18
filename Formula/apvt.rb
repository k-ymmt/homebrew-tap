class Apvt < Formula
  desc "Shows an AI agent what an iOS Simulator or macOS app's views look like"
  homepage "https://github.com/k-ymmt/apvt"
  url "https://github.com/k-ymmt/apvt/releases/download/v0.3.0/apvt-macos.tar.gz"
  sha256 "84854cb37df54069d5af0de45d042197f6e679619f5ee90dfeaf301fc2125313"
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
      apvt builds its in-app agent with Xcode on first use: it needs Xcode and
      Swift 6.2 or later (`xcrun swiftc --version`), and for simulator apps the
      iOS Simulator platform (`xcrun --sdk iphonesimulator swiftc --version`).
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/apvt --version").strip
  end
end
