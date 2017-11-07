TERMUX_PKG_HOMEPAGE=https://www.libssh2.org
TERMUX_PKG_DESCRIPTION="Client-side C library implementing the SSH2 protocol"
TERMUX_PKG_VERSION=1.8.0
TERMUX_PKG_SRCURL=https://www.libssh2.org/download/libssh2-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=39f34e2f6835f4b992cafe8625073a88e5a28ba78f83e8099610a7b3af4676d4
TERMUX_PKG_MAINTAINER="Vishal Biswas @vishalbiswas"
TERMUX_PKG_DEPENDS="openssl"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--with-openssl"
