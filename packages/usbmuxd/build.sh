TERMUX_PKG_HOMEPAGE=https://libimobiledevice.org
TERMUX_PKG_DESCRIPTION="A socket daemon to multiplex connections from and to iOS devices."
TERMUX_PKG_LICENSE="custom"
TERMUX_PKG_LICENSE_FILE="COPYING.GPLv2, COPYING.GPLv3"
TERMUX_PKG_VERSION=1.1.1
TERMUX_PKG_SRCURL=https://github.com/libimobiledevice/usbmuxd/archive/$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=e7ce30143e69d77fc5aa6fb0cb5f0cfcdbeff47eb1ac7fd90ac259a90de9fadd
TERMUX_PKG_DEPENDS="libusb, libplist"
TERMUX_PKG_BUILD_IN_SRC=true
#TERMUX_PKG_HOSTBUILD=true


termux_step_configure() {
	PKG_CONFIG_PATH=$TERMUX_PREFIX/lib/pkgconfig
        ./autogen.sh --prefix=$TERMUX_PREFIX \
		     --without-preflight \
		     --without-systemd \
		     --host=$TERMUX_HOST_PLATFORM
}
