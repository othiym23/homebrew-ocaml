require 'formula'

class Jocaml < Formula
  homepage 'http://jocaml.inria.fr/'
  url 'http://jocaml.inria.fr/pub/distri/jocaml-4.00/jocaml-4.00.0.tar.gz'
  sha1 '4443ddf956cddc87c9e749ee3eac70e46a1ede12'

  depends_on :x11
  depends_on 'objective-caml'

  def install
    ENV.j1  # JOcaml gets confused about its build dependencies if run in parallel

    system "./configure", "-prefix", prefix, "-ocamllib", "/usr/local/lib/ocaml"
    system "make world"
    system "make opt"
    system "make opt.opt"
    system "make install"
  end

  def test
    system "make bootstrap"
  end
end
