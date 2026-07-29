cask "gital" do
  version "0.1.6"
  sha256 "4e0b2116c7a2832b13295f9d6b44caa4ab5b3f564cb176ac9196674a691bc695"

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
