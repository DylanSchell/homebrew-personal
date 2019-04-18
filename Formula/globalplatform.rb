require "formula"

class Globalplatform < Formula
  desc "Global platform library"
  homepage "http://sourceforge.net/p/globalplatform/wiki/Home/"
  url "https://downloads.sourceforge.net/project/globalplatform/GlobalPlatform%20Library/GlobalPlatform%20Library%206.0.0/globalplatform-6.0.0.tar.gz"
  sha256 "fe0701c4afde4b14697749d30caa692cd21238cd64cabf408a87ad5e00483aa4"

  # Disabled, apparently HEAD uses cmake, and thus needs an entirely new formula, I guess. - ELLIOTTCABLE
  # head 'svn://svn.code.sf.net/p/globalplatform/code/trunk/globalplatform'

  def install
    ENV.append 'PCSCLITE_CFLAGS', "-I#{MacOS.sdk_path}/System/Library/Frameworks/PCSC.framework/Versions/A/Headers/"

    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
