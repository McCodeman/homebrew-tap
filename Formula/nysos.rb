class Nysos < Formula
  desc "Multi-pane scripted and interactive terminal demonstrations"
  homepage "https://github.com/McCodeman/nysos"
  url "https://github.com/McCodeman/nysos/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "287787dc5a90faf2e20d260d6956daf8b1996cac3f48973673747d71d393df29"
  license "Apache-2.0"
  head "https://github.com/McCodeman/nysos.git", branch: "main"

  depends_on "rust" => :build

  def install
    if build.stable?
      ENV["NYSOS_GIT_COMMIT"] = "78c8589a7017f863c20890162534f68ebf016630"
      ENV["NYSOS_GIT_TAG"] = "v0.1.5"
      ENV["NYSOS_GIT_DESCRIBE"] = "v0.1.5"
    end
    system "cargo", "install", *std_cargo_args
    man1.install "docs/man/nysos.1"
    doc.install "LICENSE", "NOTICE"
    pkgshare.install "sbom/nysos.spdx.json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nysos -V")
    assert_match "Git commit:", shell_output("#{bin}/nysos --version-full")
    assert_match "Valid: 2 panes, 0 queue items", shell_output("#{bin}/nysos --check")
    assert_match "Valid: 3 panes, 12 queue items", shell_output("#{bin}/nysos --demo --check")
    system bin/"nysos", "--init", "demo.toml"
    assert_match "Valid:", shell_output("#{bin}/nysos --config demo.toml --check")
  end
end
