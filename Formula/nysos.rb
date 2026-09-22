class Nysos < Formula
  desc "Multi-pane scripted and interactive terminal demonstrations"
  homepage "https://github.com/McCodeman/nysos"
  url "https://github.com/McCodeman/nysos/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "2c1a76c5779bf932c69aa9a3cdd27910deaf036a7f7be0b719d1778d1ee16e6c"
  license "Apache-2.0"
  head "https://github.com/McCodeman/nysos.git", branch: "main"

  depends_on "rust" => :build

  def install
    if build.stable?
      ENV["NYSOS_GIT_COMMIT"] = "3919f34ddd4acecd6f2b1ab94023aca9c7de7c72"
      ENV["NYSOS_GIT_TAG"] = "v0.1.1"
      ENV["NYSOS_GIT_DESCRIBE"] = "v0.1.1"
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
    assert_match "Valid: 2 panes, 6 queue items", shell_output("#{bin}/nysos --demo --check")
    system bin/"nysos", "--init", "demo.toml"
    assert_match "Valid:", shell_output("#{bin}/nysos --config demo.toml --check")
  end
end
