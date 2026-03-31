class Cresume < Formula
  desc "Cross-directory session resume picker for Claude Code"
  homepage "https://github.com/joshbermanssw/cresume"
  url "https://github.com/joshbermanssw/cresume/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "4e5913cfece77337ddcdb8a38a6cdf135054a6feb3b9030e908fa70e02219498"
  license "MIT"

  depends_on "fzf"
  depends_on "jq"

  def install
    (prefix/"share/cresume").install "cresume.sh"
  end

  def caveats
    <<~EOS
      Add the following to your shell configuration (~/.zshrc or ~/.bashrc):

        [ -f "#{opt_prefix}/share/cresume/cresume.sh" ] && source "#{opt_prefix}/share/cresume/cresume.sh"

      Then restart your terminal or run:
        source ~/.zshrc
    EOS
  end

  test do
    assert_match "cresume()", shell_output("cat #{prefix}/share/cresume/cresume.sh")
  end
end
