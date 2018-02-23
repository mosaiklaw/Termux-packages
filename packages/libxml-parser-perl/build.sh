TERMUX_PKG_HOMEPAGE=http://www.libexpat.org/
TERMUX_PKG_DESCRIPTION="Perl module for parsing XML file"
TERMUX_PKG_VERSION=2.44
TERMUX_PKG_SRCURL=http://search.cpan.org/CPAN/authors/id/T/TO/TODDR/XML-Parser-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=1ae9d07ee9c35326b3d9aad56eae71a6730a73a116b9fe9e8a4758b7cc033216
TERMUX_PKG_BUILD_IN_SRC="yes"
TERMUX_PKG_DEPENDS="perl, libexpat"
termux_step_make() {
 export LDDFLAGS="$CFLAGS -shared"
 export PERL_DIR=$TERMUX_PREFIX/lib/perl5/5.26.1
 perl Makefile.PL PERL_LIB=$PERL_DIR MAKEMAKER=$PERL_DIR/ExtUtils/MakeMaker.pm PERL_INC=$PERL_DIR/${TERMUX_ARCH}-android/CORE PERL_INCDEP=$PERL_DIR/${TERMUX_ARCH}-android/CORE  PERL_ARCHLIB=$PERL_DIR/${TERMUX_ARCH}-android PERL_ARCHLIBDEP=$PERL_DIR/${TERMUX_ARCH}-android CONFIGDEP=$PERL_DIR/${TERMUX_ARCH}-android/Config.pm EXPATLIBPATH=$TERMUX_PREFIX/lib EXPATINCPATH=$TERMUX_PREFIX/include PREFIX=$TERMUX_PREFIX AR=$AR CC=$CC RANLIB=$RANLIB LDDFLAGS=$LDDFLAGS LDFLAGS=$LDFLAGS LD=$LD CCFLAGS="$CPPFLAGS"
 sed -i "s/x86_64-linux-gnu-gcc/${TERMUX_ARCH}-linux-android-clang/g" Makefile
  sed -i "s/x86_64-linux-gnu-gcc/${TERMUX_ARCH}-linux-android-clang/g" Expat/Makefile
  make -j 4
 }
