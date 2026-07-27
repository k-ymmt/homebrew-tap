cask "gital" do
  version "0.1.1"
  sha256 "a3ee89cf32a101d94d905c0cf39e99fe659a58da2dda5c4d583f1a985770c197"

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
