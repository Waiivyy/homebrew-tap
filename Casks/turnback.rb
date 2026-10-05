# Written by scripts/homebrew-cask.sh in https://github.com/Waiivyy/turnback
# for each release. Changes made here are replaced by the next release.
cask "turnback" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.2.0"
  sha256 arm:          "b5e8951a06f29463067d32384da0a23dc344f3195aea4ad367df7816375092af",
         intel:        "42f77fb0c5187340ec8b587ab3aa7520cb183f1d3a2baa207c9009f8343ec823",
         arm64_linux:  "4ba7a02f3c36275be93189d7adaf98c3eb8fa3c410342941687f17c44e7bfca7",
         x86_64_linux: "16fa3aa350769282c37ec1e0758bfad5156c73de00613974c69325469806a24d"

  url "https://github.com/Waiivyy/turnback/releases/download/v#{version}/turnback_#{os}_#{arch}.tar.gz"
  name "turnback"
  desc "Per-turn history and selective undo for AI coding agents"
  homepage "https://github.com/Waiivyy/turnback"

  binary "turnback_#{os}_#{arch}/turnback"

  # The binaries are not signed by Apple, so Gatekeeper would refuse to run
  # a copy marked as downloaded from the internet.
  postflight_steps do
    on_macos do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}"]
    end
  end
end
