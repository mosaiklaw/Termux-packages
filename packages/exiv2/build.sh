TERMUX_PKG_HOMEPAGE=http://exiv2.org
TERMUX_PKG_DESCRIPTION="Exif, Iptc and XMP metadata manipulation library and tools"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"
TERMUX_PKG_VERSION=0.26
TERMUX_PKG_REVISION=6
TERMUX_PKG_SRCURL=https://github.com/Exiv2/exiv2/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=51cffa8d19d67e1da6c1d0f570a75b8f6c814113367318c2c0407691888c5f01
TERMUX_PKG_DEPENDS="libandroid-support, libc++, libexpat, zlib"

TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DEXIV2_ENABLE_VIDEO=ON
-DEXIV2_ENABLE_BUILD_SAMPLES=OFF"
