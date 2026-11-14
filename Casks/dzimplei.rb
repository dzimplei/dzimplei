cask "dzimplei" do
  version "0.9.6"
  sha256 "4c59eb6a815bca5e05ad4b49f6b6e2f420f14f6520429696e55d2533fa271315"

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
