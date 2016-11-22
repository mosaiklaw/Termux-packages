TERMUX_PKG_HOMEPAGE=http://php.net/
TERMUX_PKG_DESCRIPTION="Server-side, HTML-embedded scripting language"
_PHP_RC=6
TERMUX_PKG_VERSION=7.1~rc${_PHP_RC}
TERMUX_PKG_SRCURL=https://downloads.php.net/~krakjoe/php-7.1.0RC${_PHP_RC}.tar.xz
# Build native php for phar to build (see pear-Makefile.frag.patch):
TERMUX_PKG_HOSTBUILD=true
# Build the native php without xml support as we only need phar:
TERMUX_PKG_EXTRA_HOSTBUILD_CONFIGURE_ARGS="--disable-libxml --disable-dom --disable-simplexml --disable-xml --disable-xmlreader --disable-xmlwriter --without-pear"
TERMUX_PKG_DEPENDS="libandroid-glob, libxml2, liblzma, openssl, pcre, libbz2, libcrypt, libmcrypt, libcurl, libgd, readline, freetype"

TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" ac_cv_func_res_nsearch=no"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --mandir=$TERMUX_PREFIX/share/man"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --with-bz2=$TERMUX_PREFIX"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --with-curl=$TERMUX_PREFIX"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --with-freetype-dir=$TERMUX_PREFIX"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --with-gd=$TERMUX_PREFIX"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --with-iconv=$TERMUX_PREFIX"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --with-libxml-dir=$TERMUX_PREFIX"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --with-mcrypt=$TERMUX_PREFIX"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --with-openssl=$TERMUX_PREFIX"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --with-pcre-regex=$TERMUX_PREFIX"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --with-readline=$TERMUX_PREFIX"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --with-zlib"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --enable-bcmath"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --enable-calendar"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --enable-exif"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --enable-gd-native-ttf=$TERMUX_PREFIX"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --enable-mbstring"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --enable-opcache"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --enable-sockets"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --enable-zip"

termux_step_pre_configure () {
	LDFLAGS+=" -landroid-glob"

	export PATH=$PATH:$TERMUX_PKG_HOSTBUILD_DIR/sapi/cli/
	export NATIVE_PHP_EXECUTABLE=$TERMUX_PKG_HOSTBUILD_DIR/sapi/cli/php

	# Run autoconf since we have patched config.m4 files.
	cd $TERMUX_PKG_SRCDIR
	autoconf
}

termux_step_post_configure () {
	# Avoid src/ext/gd/gd.c trying to include <X11/xpm.h>:
	perl -p -i -e 's/#define HAVE_GD_XPM 1//' $TERMUX_PKG_BUILDDIR/main/php_config.h
	# Avoid src/ext/standard/dns.c trying to use struct __res_state:
	perl -p -i -e 's/#define HAVE_RES_NSEARCH 1//' $TERMUX_PKG_BUILDDIR/main/php_config.h
}
