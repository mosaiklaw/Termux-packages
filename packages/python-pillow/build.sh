TERMUX_PKG_HOMEPAGE=http://python-pillow.github.io/
TERMUX_PKG_DESCRIPTION="Python Imaging Library"
TERMUX_PKG_LICENSE="custom"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=9.2.0
TERMUX_PKG_SHA256=95836f00972dbf724bf1270178683a0ac4ea23c6c3a980858fc9f2f9456e32ef
TERMUX_PKG_SRCURL=https://github.com/python-pillow/Pillow/archive/refs/tags/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_DEPENDS="freetype, libimagequant, libjpeg-turbo, libraqm, libtiff, libwebp, libxcb, littlecms, openjpeg, python, zlib"
TERMUX_PKG_LICENSE_FILE="LICENSE"

termux_step_configure() {
	_PYTHON_VERSION=$(. $TERMUX_SCRIPTDIR/packages/python/build.sh; echo $_MAJOR_VERSION)

	termux_setup_python_crossenv
	pushd $TERMUX_PYTHON_CROSSENV_SRCDIR
	_CROSSENV_PREFIX=$TERMUX_PKG_BUILDDIR/python-crossenv-prefix
	python${_PYTHON_VERSION} -m crossenv \
		$TERMUX_PREFIX/bin/python${_PYTHON_VERSION} \
		${_CROSSENV_PREFIX}
	popd
	. ${_CROSSENV_PREFIX}/bin/activate

	LDFLAGS+=" -lpython${_PYTHON_VERSION}"
}

termux_step_make_install() {
	pip -v install --prefix $TERMUX_PREFIX $TERMUX_PKG_SRCDIR
}
