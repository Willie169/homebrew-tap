class Godot < Formula
  desc "2D and 3D game engine"
  homepage "https://godotengine.org"
  version "4.6.2"
  license "MIT"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+)-stable/i)
    strategy :github_latest
  end

  on_macos do
    def install
      odie "This formula is only available on Linux. Use brew install --cask godot for macOS"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/godotengine/godot/releases/download/#{version}-stable/Godot_v#{version}-stable_linux.arm64.zip"
      sha256 "c9154154de14acb1f38a6c8618f01f4111ecbd1cdbcecd0a5151be42de2bd1c9"
    else
      url "https://github.com/godotengine/godot/releases/download/#{version}-stable/Godot_v#{version}-stable_linux.x86_64.zip"
      sha256 "30e6b6d141f0cd5bebd629ad1d0ef1324e60091bb20662d026b402ba58c59937"
    end
  end

  def install
    bin.install Dir["Godot_v*-stable_linux.*"].first => "godot"
  end

  test do
    system "#{bin}/godot", "--version"
  end
end
