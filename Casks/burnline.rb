cask "burnline" do
  version "1.0"
  sha256 "2038981f111a9da8dcf3d83e8f05b3a2a87a1f5db38f4b6d8368c88abecbc38f"

  url "https://github.com/Stixum/Burnline/releases/download/v#{version}/Burnline.dmg"
  name "Burnline"
  desc "Menu bar app showing Claude usage against the weekly pace target"
  homepage "https://github.com/Stixum/Burnline"

  depends_on macos: ">= :sonoma"

  app "Burnline.app"

  # Deliberately does NOT remove the statusLine key from ~/.claude/settings.json.
  # A cask cannot safely edit a user's config file, and a leftover key pointing
  # at a deleted binary merely prints "command not found" in the status line ,
  # annoying, but it does not break Claude Code. Removing it wrongly would.
  zap trash: [
    "~/Library/Application Support/Burnline",
  ]
end
