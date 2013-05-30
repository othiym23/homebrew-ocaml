require 'formula'

class Aurochs < Formula
  homepage 'http://github.com/berke/aurochs'
  head 'https://github.com/berke/aurochs.git'

  depends_on 'ocaml' => :build

  def install
    # ENV.j1  # if your formula's build system can't parallelize

    system "make PREFIX=#{prefix} install" # if this fails, try separate make/make install steps
  end

  def test
    system "aurochs"
  end
end
