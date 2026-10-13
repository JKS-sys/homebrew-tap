# Pour — the Homebrew-compatible package manager that installs in milliseconds.
# Copyright (c) 2026 Jagadeesh Kumar S. All rights reserved.
class Pour < Formula
  desc "Homebrew-compatible package manager that installs in milliseconds"
  homepage "https://ipconfig.co.network/pour"
  version "0.1.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://ipconfig.co.network/pour/dl/v0.1.0/pour-macos-arm64"
      sha256 "819e6136cf9183c1098d8c697bd41d68b3405ff68a8665d50018dd4b17e2577b"
    end
    on_intel do
      url "https://ipconfig.co.network/pour/dl/v0.1.0/pour-macos-x86_64"
      sha256 "a452a8c48d8c7dc8ab5a01024883e6d24fbd4892e9a1b63bf73a82fa33354350"
    end
  end
  on_linux do
    on_arm do
      url "https://ipconfig.co.network/pour/dl/v0.1.0/pour-linux-arm64"
      sha256 "f300bdb5eac573369aa87353f3dee1ce5d75076eb90b00411a414db3fe8aa959"
    end
    on_intel do
      url "https://ipconfig.co.network/pour/dl/v0.1.0/pour-linux-x86_64"
      sha256 "d257e85abfd3ad23c6f1e3d32d027ca0d6a59f1cbe10d295b5dc377694771bb3"
    end
  end

  livecheck do
    url "https://ipconfig.co.network/pour/releases/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  def install
    downloaded = Dir["pour-*"].first
    chmod 0755, downloaded
    bin.install downloaded => "pour"
    generate_completions_from_executable(bin/"pour", "completions")
  end

  def caveats
    <<~EOS
      Pour keeps its own prefix at /opt/pour. Create it once:
        pour init
      then add to your shell:
        eval "$(pour shellenv)"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pour --version")
  end
end
