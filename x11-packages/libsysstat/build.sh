TERMUX_PKG_HOMEPAGE=https://lxqt.github.io
TERMUX_PKG_DESCRIPTION="A library to query system information"
TERMUX_PKG_LICENSE="LGPL-2.1"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="1.0.0"
TERMUX_PKG_SRCURL="https://github.com/lxqt/libsysstat/releases/download/${TERMUX_PKG_VERSION}/libsysstat-${TERMUX_PKG_VERSION}.tar.xz"
TERMUX_PKG_SHA256=f79b5e3e2e79a52b58fab5639f11b7a5f40e4a9995660181712cb4c4cd460435
TERMUX_PKG_DEPENDS="libc++, qt6-qtbase"
TERMUX_PKG_BUILD_DEPENDS="lxqt-build-tools, qt6-qttools"
TERMUX_PKG_AUTO_UPDATE=true
