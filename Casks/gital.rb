cask "gital" do
  version "0.1.16"
  sha256 "91c538546505371b5f6e141135a449bb5f4b77d932d69f5c509f5ee9d49cacb2"

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
