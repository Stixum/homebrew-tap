cask "burnline" do
  version "1.4"
  sha256 "962d0fc9f73c773f8176b149b5f0b3f84e2c13f3833d102bf8723c73fc4fe9f2"

  url "https://github.com/Stixum/Burnline/releases/download/v#{version}/Burnline.dmg"
  name "Burnline"
  desc "Menu bar app showing Claude usage against the weekly pace target"
  homepage "https://github.com/Stixum/Burnline"

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
