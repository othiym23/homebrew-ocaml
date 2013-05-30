require 'formula'

class Camomile < Formula
  homepage 'http://camomile.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/camomile/camomile/0.8.3/camomile-0.8.3.tar.bz2'
  sha1 '9f2600010820689805b5ab6e4048217ea821d535'

  depends_on 'objective-caml'
  depends_on 'findlib'

  keg_only "This is an OCaml library that gets installed to OCaml's site library."

  def install
    ENV.j1
    system "./configure", "--datarootdir=#{share}"
    system "make"
    system "make install"
  end
end
