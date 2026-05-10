class Godot < Formula
  desc "2D and 3D game engine"
  homepage "https://godotengine.org"
  version "4.6.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    url "file:///dev/null"
    sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/godotengine/godot/releases/download/4.6.2-stable/Godot_v4.6.2-stable_linux.arm64.zip"
      sha256 "4e735876036ff95a9917247ad618328e981e38b91661853a3b7d781171fbf085" #arm64
    else
      url "https://github.com/godotengine/godot/releases/download/4.6.2-stable/Godot_v4.6.2-stable_linux.x86_64.zip"
      sha256 "cecd0cb6b55e931318a9d7237dc4197d69ea914966787a454808523626e2789f" #x86_64
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
