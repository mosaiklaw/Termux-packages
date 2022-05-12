TERMUX_PKG_HOMEPAGE=https://github.com/pystardust/ani-cli
TERMUX_PKG_DESCRIPTION="A cli to browse and watch anime"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=2.2
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/pystardust/ani-cli/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=973d335a75bd7f920c244000ad6b057f702fb37752e7bea1b5bcf038785ec925
TERMUX_PKG_DEPENDS="aria2, curl, grep, openssl-tool, sed, gawk, ffmpeg"
TERMUX_PKG_CONFLICTS="mpv, mpv-x"
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make_install() {
	install -Dm700 -t $TERMUX_PREFIX/bin ani-cli
	echo 'am start --user 0 -a android.intent.action.VIEW -d "$1" -n is.xyz.mpv/.MPVActivity' > $PREFIX/bin/mpv
}

termux_step_create_debscripts() {
	{
		echo "#!$TERMUX_PREFIX/bin/sh"
		echo "echo ''"
		echo "echo 'Note that you need to have the mpv android app installed'"
		echo "echo ''"
	} > ./postinst
}
