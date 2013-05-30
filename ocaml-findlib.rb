require 'formula'

class OcamlFindlib < Formula
  homepage 'http://projects.camlcity.org/projects/findlib.html'
  url 'http://download.camlcity.org/download/findlib-1.3.3.tar.gz'
  sha1 '5d1a52b77145348ded29fefe13736694aabb1868'

  depends_on "objective-caml"

  def install
      ENV.deparallelize
      inreplace "findlib.conf.in" do |s|
          # Fix '@SITELIB'
          s.gsub! "@SITELIB@", "#{HOMEBREW_PREFIX}/lib/ocaml/site-lib"
      end
      system "./configure", "-bindir", bin, "-mandir", man, "-sitelib", "#{lib}/ocaml/site-lib", "-config", "#{prefix}/etc/findlib.conf"
      system "make all opt"
      system "make install"
  end
end
