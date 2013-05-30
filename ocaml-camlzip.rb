require 'formula'

class OcamlCamlzip < Formula
    homepage 'http://cristal.inria.fr/~xleroy/software.html#camlzip'
    url 'http://forge.ocamlcore.org/frs/download.php/1037/camlzip-1.05.tar.gz'
    sha1 '0c32485958dd1a9c18f6f0abe1d2bf8e62caef74'

    depends_on 'objective-caml'
    depends_on 'ocaml-findlib' => :build

    def install
        ENV.deparallelize
        ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"

        (lib + "ocaml/site-lib/").mkpath

        system "make all"
        system "make allopt"
        system "make install-findlib"
    end
end
