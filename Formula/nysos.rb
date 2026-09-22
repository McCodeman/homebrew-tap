class Nysos < Formula
  desc "Multi-pane scripted and interactive terminal demonstrations"
  homepage "https://github.com/McCodeman/nysos"
  url "https://github.com/McCodeman/nysos/archive/7f5dcfd9cfb2eef9593f214e9fdfbc1279d004e0.tar.gz"
  version "0.1.0"
  sha256 "44e91207f0f5c2c15d72acd372904749bc4f99897402632b9e22d8e2259e789a"
  license "MIT"
  head "https://github.com/McCodeman/nysos.git", branch: "main"

  depends_on "rust" => :build

  def install
    if build.stable?
      ENV["NYSOS_GIT_COMMIT"] = "7f5dcfd9cfb2eef9593f214e9fdfbc1279d004e0"
      ENV["NYSOS_GIT_DESCRIBE"] = "7f5dcfd9cfb2"
    end
    system "cargo", "install", *std_cargo_args
    man1.install "docs/man/nysos.1"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nysos -V")
    assert_match "Git commit:", shell_output("#{bin}/nysos --version-full")
    system bin/"nysos", "--init", "demo.toml"
    assert_match "Valid:", shell_output("#{bin}/nysos --config demo.toml --check")
  end
end
