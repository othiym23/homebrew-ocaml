require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class OcamlCryptokit < Formula
    homepage 'http://forge.ocamlcore.org/projects/cryptokit/'
    url 'http://forge.ocamlcore.org/frs/download.php/1166/cryptokit-1.7.tar.gz'
    sha1 '5b945663676f03f1bad609d97a0f901980940531'

    depends_on 'objective-caml'
    depends_on 'ocaml-findlib' => :build

    def install
        ENV.deparallelize
        ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"

        (lib + "ocaml/site-lib/").mkpath

        system "ocaml", "setup.ml", "-configure", "--bindir", bin
        system "ocaml", "setup.ml", "-build"
        system "ocaml", "setup.ml", "-install"
    end
end
