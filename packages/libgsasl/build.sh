TERMUX_PKG_HOMEPAGE=https://www.gnu.org/software/gsasl
TERMUX_PKG_DESCRIPTION="GNU SASL library"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=1.10.0
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://ftp.gnu.org/gnu/gsasl/libgsasl-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=f1b553384dedbd87478449775546a358d6f5140c15cccc8fb574136fdc77329f
TERMUX_PKG_DEPENDS="libidn"
TERMUX_PKG_BREAKS="libgsasl-dev"
TERMUX_PKG_REPLACES="libgsasl-dev"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--without-libgcrypt"
