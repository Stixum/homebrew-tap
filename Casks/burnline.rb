cask "burnline" do
  version "1.6.5"
  sha256 "4c0b9aab4349b44d660c6818df23c325193e19cc59d90e15e99c65431d658d56"

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
