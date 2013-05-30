require 'formula'

class OcamlPcre < Formula
  homepage 'https://bitbucket.org/mmottl/pcre-ocaml'
  url 'https://bitbucket.org/mmottl/pcre-ocaml/downloads/pcre-ocaml-6.2.5.tar.gz'
  sha1 '921094ba7a810a364c119d1099952551c90d19ec'

  depends_on 'objective-caml'
  depends_on 'ocaml-findlib' => :build

  depends_on 'pcre'

  def install
    ENV.deparallelize
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"

    (lib + "ocaml/site-lib/").mkpath

    system "make"
    system "make install"
  end
end
