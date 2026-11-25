cask "dzimplei" do
  version "0.9.15"
  sha256 "0ad713418931fa333390594aeed8398516556ecb0e5ddb74c42a2148eefe918a"

  url "https://github.com/t-shark-9/dzimplei/releases/download/v#{version}/dzimplei-mac-arm64.dmg"
  name "dzimplei"
  desc "Workspaces, agents and Claude Code sessions in one app"
  homepage "https://dzimplei.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself (electron-updater), so brew does not fight it.
  auto_updates true
  depends_on arch: :arm64

  app "dzimplei.app"

  # Caches and preferences only. Your workspaces and chats live in
  # ~/Library/Application Support/dzimplei and are never removed by brew.
  zap trash: [
    "~/Library/Caches/dzimplei-updater",
    "~/Library/Logs/dzimplei",
    "~/Library/Preferences/com.dzimplei.app.plist",
    "~/Library/Saved Application State/com.dzimplei.app.savedState",
  ]
end
