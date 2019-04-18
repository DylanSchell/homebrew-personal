require "formula"

class Gpshell < Formula
  desc "gpshell utility"
  homepage "http://sourceforge.net/p/globalplatform/wiki/Home/"
  url "https://downloads.sourceforge.net/project/globalplatform/GPShell/GPShell-1.4.4/gpshell-1.4.4.tar.gz"
  sha256 "11b3a893e0fca7775124146ee4a798d443eb2fd1058513f6fa6a0be7f73f47a5"

  # ./configure doesn't recognize GlobalPlatform without this
  depends_on 'pkg-config' => :build
  depends_on 'globalplatform'
  depends_on 'gppcscconnectionplugin'


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
