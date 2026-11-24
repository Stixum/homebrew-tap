cask "burnline" do
  version "1.7"
  sha256 "6fd6f3eb68051077bd0784cb3711aa937a0e26d28aa5a135f1b82f631358b7ff"

  url "https://github.com/Stixum/Burnline/releases/download/v#{version}/Burnline.dmg"
  name "Burnline"
  desc "Menu bar app showing Claude usage against the weekly pace target"
  homepage "https://github.com/Stixum/Burnline"

  auto_updates true
  depends_on macos: :sonoma

  app "Burnline.app"

  # Deliberately does NOT remove the statusLine key from ~/.claude/settings.json.
  # A cask cannot safely edit a user's config file, and a leftover key pointing
  # at a deleted binary merely prints "command not found" in the status line —
  # annoying, but it does not break Claude Code. Removing it wrongly would.
  zap trash: [
    "~/Library/Application Support/Burnline",
  ]
end
