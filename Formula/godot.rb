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
    url "https://github.com/godotengine/godot/releases/download/#{version}-stable/Godot_v#{version}-stable_macos.universal.zip"
    sha256 "f43613ad72ab1cc9ef14383545f4de344844451a5c9c5f4ea4a923f1f34f91e4"
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/godotengine/godot/releases/download/#{version}-stable/Godot_v#{version}-stable_linux.arm64.zip"
      sha256 "4e735876036ff95a9917247ad618328e981e38b91661853a3b7d781171fbf085"
    else
      url "https://github.com/godotengine/godot/releases/download/#{version}-stable/Godot_v#{version}-stable_linux.x86_64.zip"
      sha256 "cecd0cb6b55e931318a9d7237dc4197d69ea914966787a454808523626e2789f"
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
