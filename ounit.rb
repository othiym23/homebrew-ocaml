require 'formula'

class Ounit < Formula
  homepage 'http://ounit.forge.ocamlcore.org/'
  url 'http://forge.ocamlcore.org/frs/download.php/886/ounit-1.1.2.tar.gz'
  sha1 'c7311ac200138958eec9b49274083989a0b097f1'

  depends_on 'objective-caml'
  depends_on 'findlib'

  def install
    ENV.j1

    system "./configure", "--prefix", prefix
    system "make all"
    system "make install"
  end
end
