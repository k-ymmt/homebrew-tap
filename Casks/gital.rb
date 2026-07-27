cask "gital" do
  version "1.0"
  sha256 "6e8e9d3cd7ef8761c3adf9939734a5a2fd101eedd7b39c3a61135ceaa520bce7"

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
