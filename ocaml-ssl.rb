require 'formula'

class OcamlSsl < Formula
    homepage 'https://github.com/savonet/ocaml-ssl'
    url 'http://downloads.sourceforge.net/project/savonet/ocaml-ssl/0.4.6/ocaml-ssl-0.4.6.tar.gz'
    sha1 'e42e9518a982ef559f249a22e1fe37cddc45360f'

    depends_on 'objective-caml'
    depends_on 'ocaml-findlib' => :build

    def install
        ENV.deparallelize
        ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"

        (lib + "ocaml/site-lib/").mkpath

        system "./configure"
        system "make"
        system "make install"
    end
end
