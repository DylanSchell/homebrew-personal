require "formula"

class Gpshell < Formula
  homepage "http://sourceforge.net/p/globalplatform/wiki/Home/"
  url "https://downloads.sourceforge.net/project/globalplatform/GPShell/GPShell-1.4.4/gpshell-1.4.4.tar.gz"
  sha1 "3efeb92263e881ff0886e73a7b790051a317df61"

  depends_on 'globalplatform'
  depends_on 'gppcscconnectionplugin'

  # ./configure doesn't recognize GlobalPlatform without this
  depends_on 'pkg-config' => :build

  def install
    ENV.append 'PCSCLITE_CFLAGS', "-I#{MacOS.sdk_path}/System/Library/Frameworks/PCSC.framework/Versions/A/Headers/"
    ENV.append 'GLOBALPLATFORM_CFLAGS', "-I#{Formula["globalplatform"].opt_prefix}/include/globalplatform"
    ENV.append 'GLOBALPLATFORM_LIBS', "#{Formula["globalplatform"].opt_prefix}/lib/libglobalplatform.dylib"


    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

end
