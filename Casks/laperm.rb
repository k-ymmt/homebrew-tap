cask "laperm" do
  version "0.1.0,417"
  sha256 "f3bd3856f01ed84565e613d59caf1d1de1c42c0c2592462e55d08badbdb7a7b0"

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
  # The `laperm` CLI shipped inside the app (ADR 0049); it needs no sandbox and runs the Helper in place.
  binary "#{appdir}/Laperm.app/Contents/Helpers/laperm"

  zap trash: [
    "~/Library/Application Scripts/app.kymmt.LapermMac",
    "~/Library/Containers/app.kymmt.LapermMac",
    "~/Library/Saved Application State/app.kymmt.LapermMac.savedState",
  ]
end
