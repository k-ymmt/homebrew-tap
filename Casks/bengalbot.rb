cask "bengalbot" do
  version "0.1.0,256"
  sha256 "f3f27ad89b4f7889d1dde1b1fb13a8b2288a9439732e8f2391e3ec45d7ccf734"

  url "https://github.com/k-ymmt/homebrew-tap/releases/download/bengalbot-v#{version.csv.first}-#{version.csv.second}/BengalBot-#{version.csv.first}-#{version.csv.second}.zip"
  name "BengalBot"
  desc "Client for a self-hosted personal agent running on your own Mac"
  homepage "https://github.com/k-ymmt/homebrew-tap"

  # The zips live in this tap's own Releases (the app repository is private), tagged
  # `bengalbot-v<version>-<build>`: `:github_releases` looks at the recent releases and the
  # `bengalbot-` prefix keeps the other tools' out.
  livecheck do
    url :url
    regex(/^bengalbot-v?(\d+(?:\.\d+)+)-(\d+)$/i)
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

  app "BengalBot.app"

  zap trash: [
    "~/Library/Application Scripts/app.kymmt.bengalbot",
    "~/Library/Containers/app.kymmt.bengalbot",
  ]
end
