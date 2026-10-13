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
      sha256 "60671e5d2b8ca19cdcaa2aec23e2f91b4f40fd8891332001e999723b537e8b4e"
    end
    on_intel do
      url "https://ipconfig.co.network/pour/dl/v0.1.0/pour-macos-x86_64"
      sha256 "c7c6c01c4a1d058bca98342fd4f0e9ca6b2053969973161c49c5edc66c8f145a"
    end
  end
  on_linux do
    on_arm do
      url "https://ipconfig.co.network/pour/dl/v0.1.0/pour-linux-arm64"
      sha256 "660b7ee68989cb013f3608d65bdaa0f05b5658c74a056273f93c972cede89945"
    end
    on_intel do
      url "https://ipconfig.co.network/pour/dl/v0.1.0/pour-linux-x86_64"
      sha256 "e0db46f67557cb087cbd2c2ad2e32ed4b56d3319399448b40449eb762eb890b2"
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
