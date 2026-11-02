cask "gital" do
  version "0.1.14"
  sha256 "46ca4fe5b84010c86e18072736b08367d21fa6585f747ecd32fa14a7cad811a7"

  url "https://github.com/k-ymmt/Gital/releases/download/v#{version}/Gital-#{version}.zip"
  name "Gital"
  desc "Native macOS Git client built with SwiftUI"
  homepage "https://github.com/k-ymmt/Gital"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "Gital.app"

  zap trash: [
    "~/Library/Preferences/app.kymmt.Gital.plist",
    "~/Library/Saved Application State/app.kymmt.Gital.savedState",
  ]
end
