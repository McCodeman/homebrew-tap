class Nysos < Formula
  desc "Multi-pane scripted and interactive terminal demonstrations"
  homepage "https://github.com/McCodeman/nysos"
  url "https://github.com/McCodeman/nysos/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "dff66c4253a7a32d42daf458eadedd9723d3f39c04f909f3b00ca4192dbcf63c"
  license "Apache-2.0"
  head "https://github.com/McCodeman/nysos.git", branch: "main"

  depends_on "rust" => :build

  def install
    if build.stable?
      ENV["NYSOS_GIT_COMMIT"] = "f9a2fdaa137f5c6e5e60d656b1b91bee845ad586"
      ENV["NYSOS_GIT_TAG"] = "v0.1.3"
      ENV["NYSOS_GIT_DESCRIBE"] = "v0.1.3"
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
    assert_match "Valid: 3 panes, 6 queue items", shell_output("#{bin}/nysos --demo --check")
    system bin/"nysos", "--init", "demo.toml"
    assert_match "Valid:", shell_output("#{bin}/nysos --config demo.toml --check")
  end
end
