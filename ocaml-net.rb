require 'formula'

class OcamlNet < Formula
  homepage 'http://projects.camlcity.org/projects/ocamlnet.html'
  url 'http://download.camlcity.org/download/ocamlnet-3.6.3.tar.gz'
  sha1 '9cf4b8eb293313140ee89ef8be9fa146b97abcce'

  depends_on 'objective-caml'
  depends_on 'ocaml-findlib' => :build

  depends_on 'ocaml-pcre'
  depends_on 'ocaml-cryptokit'
  depends_on 'ocaml-ssl'
  depends_on 'ocaml-camlzip'

  def install
    ENV.deparallelize
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"

    (lib + "ocaml/site-lib/").mkpath

    system "./configure", "-enable-ssl", "-enable-crypto", "-enable-zip", "-enable-pcre", "-bindir", bin
    # gotta make sure ocamlrpcgen regenerates these files:
    # rpc_auth_gssapi_aux.ml
    # rpc_portmapper_aux.ml
    # rpc_portmapper_clnt.ml
    # rm "src/rpc/rpc_auth_gssapi_aux.ml"
    # rm "src/rpc/rpc_portmapper_aux.ml"
    # rm "src/rpc/rpc_portmapper_clnt.ml"
    # system "touch", "src/rpc/*.x"
    system "make all"
    system "make opt"
    system "make install"
  end
end
