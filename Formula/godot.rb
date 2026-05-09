class Godot < Formula
  desc "2D and 3D game engine"
  homepage "https://godotengine.org"
  license "MIT"
  version "4.6.2"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/godotengine/godot/releases/download/#{version}-stable/Godot_v#{version}-stable_linux.arm64.zip"
      sha256 "ARM64_SHA256"
      @_bin_name = "Godot_v#{version}-stable_linux.arm64"
    elsif Hardware::CPU.intel?
      url "https://github.com/godotengine/godot/releases/download/#{version}-stable/Godot_v#{version}-stable_linux.x86_64.zip"
      sha256 "X86_64_SHA256"
      @_bin_name = "Godot_v#{version}-stable_linux.x86_64"
    else
      odie "Unsupported CPU architecture"
    end
  end

  def install
    bin.install @_bin_name => "godot"
  end

  test do
    system "#{bin}/godot", "--version"
  end

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+)-stable/i)
    strategy :github_latest
  end
end