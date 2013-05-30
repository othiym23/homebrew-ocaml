require 'formula'

class Batteries < Formula
  homepage 'http://batteries.forge.ocamlcore.org/'
  url 'http://forge.ocamlcore.org/frs/download.php/950/batteries-1.5.0.tar.gz'
  sha1 '658a8401676d04f785ab2e98ea1586d5b49d5481'

  depends_on :x11
  depends_on 'objective-caml'
  depends_on 'findlib'
  depends_on 'camomile'
  depends_on 'ounit'

  def install
    ENV.j1
    system "make"
    system "make install"
  end
end
