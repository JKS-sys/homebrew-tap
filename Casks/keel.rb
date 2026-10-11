cask "keel" do
  arch arm: "apple-silicon", intel: "intel"

  version "0.4.6"
  sha256 arm:   "5c85597a479993443a94c44f0684ca0837c106c82b45cfe51251de99cbdd0688",
         intel: "289e2766996b13b2e094715110d21c2af149d0725d612dea43ab164075b6f8e5"

  url "https://github.com/JKS-sys/keel-releases-29-sep-2026/releases/download/v#{version}/Keel-#{version}-macos-#{arch}-11-oct-2026.dmg"
  name "Keel"
  desc "AI terminal that shows at a glance which commands worked and which failed"
  homepage "https://ipconfig.co.network/keel"

  livecheck do
    url "https://ipconfig.co.network/updates/keel/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: :big_sur

  app "Keel.app"

  # Keel is not notarised with Apple: clear the quarantine mark so it opens
  # without the "Apple could not verify" dialog.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Keel.app"],
                   sudo: false
  end

  zap trash: [
    "~/.keel",
    "~/Library/Application Support/network.co.ipconfig.keel",
    "~/Library/Caches/network.co.ipconfig.keel",
    "~/Library/Preferences/network.co.ipconfig.keel.plist",
    "~/Library/Saved Application State/network.co.ipconfig.keel.savedState",
  ]
end