class Godot < Formula
  desc "2D and 3D game engine"
  homepage "https://godotengine.org"
  version "4.6.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    url "file:///dev/null"
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/godotengine/godot/releases/download/#{version}-stable/Godot_v#{version}-stable_linux.arm64.zip"
    else
      url "https://github.com/godotengine/godot/releases/download/4.6.1-stable/Godot_v4.6.1-stable_linux.x86_64.zip"
    end
  end

  def install
    odie "This formula is only available on Linux. Use brew install --cask godot on macOS." if OS.mac?
    bin.install Dir["Godot_v*-stable_linux.*"].first => "godot"
  end

  test do
    system "#{bin}/godot", "--version"
  end
end
