class Groovyenv < Formula
  desc "Groovy environment manager - install and switch between Groovy versions"
  homepage "https://github.com/latte-java/groovyenv"
  url "https://github.com/latte-java/groovyenv/archive/refs/heads/main.tar.gz"
  version "0.1.0"
  license "MIT"

  def install
    bin.install "groovyenv"
  end

  def post_install
    (var/"lib/groovyenv/groovy").mkpath
  end

  def caveats
    <<~EOS
      To use groovyenv, create a .groovyversion file in your project directory
      or ~/.groovyversion with the Groovy version you want (e.g., 4.0.31).

      Then install that version:
        groovyenv install 4.0.31

      And generate the shims:
        groovyenv reshim

      Ensure #{HOMEBREW_PREFIX}/bin is in your PATH (it usually is with Homebrew).
    EOS
  end

  test do
    assert_match "Usage: groovyenv", shell_output("#{bin}/groovyenv help")
  end
end
