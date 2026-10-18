cask "laperm" do
  version "0.1.0,357"
  sha256 "6707b1f8fe7b3e462406988f4df5f7ec9f6a71581fa926d9e59f97d8b478eca5"

  url "https://github.com/k-ymmt/homebrew-tap/releases/download/laperm-v#{version.csv.first}-#{version.csv.second}/Laperm-#{version.csv.first}-#{version.csv.second}.zip"
  name "Laperm"
  desc "Local Markdown editor built around a folder of plain .md files"
  homepage "https://github.com/k-ymmt/homebrew-tap"

  # The zips live in this tap's own Releases (the app repository is private), tagged
  # `laperm-v<version>-<build>` so other tools can publish here too: `:github_releases` looks at
  # the recent releases and the `laperm-` prefix keeps the others out.
  livecheck do
    url :url
    regex(/^laperm-v?(\d+(?:\.\d+)+)-(\d+)$/i)
    strategy :github_releases do |json, regex|
      json.filter_map do |release|
        next if release["draft"] || release["prerelease"]

        match = release["tag_name"]&.match(regex)
        next if match.blank?

        "#{match[1]},#{match[2]}"
      end
    end
  end

  depends_on macos: :tahoe

  app "LapermMac.app", target: "Laperm.app"

  zap trash: [
    "~/Library/Application Scripts/app.kymmt.LapermMac",
    "~/Library/Containers/app.kymmt.LapermMac",
    "~/Library/Saved Application State/app.kymmt.LapermMac.savedState",
  ]
end
