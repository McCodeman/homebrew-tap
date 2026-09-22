class Nysos < Formula
  desc "Multi-pane scripted and interactive terminal demonstrations"
  homepage "https://github.com/McCodeman/nysos"
  url "https://github.com/McCodeman/nysos/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "036b9ca620b0cceb515438dea34e3f99432bb28c82ea3eba835141fe4b081990"
  license "Apache-2.0"
  head "https://github.com/McCodeman/nysos.git", branch: "main"

  depends_on "rust" => :build

  def install
    if build.stable?
      ENV["NYSOS_GIT_COMMIT"] = "0a6de8a21c0f2574d30c32356dc419698004d8d7"
      ENV["NYSOS_GIT_TAG"] = "v0.1.4"
      ENV["NYSOS_GIT_DESCRIBE"] = "v0.1.4"
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
