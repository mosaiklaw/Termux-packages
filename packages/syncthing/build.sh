TERMUX_PKG_HOMEPAGE=https://syncthing.net/
TERMUX_PKG_DESCRIPTION="Decentralized file synchronization"
TERMUX_PKG_VERSION=0.14.43
TERMUX_PKG_SHA256=bb0250e0bafce690a8ce3f43f0ab8349874ac1c8f3cdc224ed5d0110099bbd9c
TERMUX_PKG_SRCURL=https://github.com/syncthing/syncthing/releases/download/v${TERMUX_PKG_VERSION}/syncthing-source-v${TERMUX_PKG_VERSION}.tar.gz

termux_step_make(){
	termux_setup_golang

	# The build.sh script doesn't with our compiler
	# so small adjustments to file locations are needed
	# so the build.go is fine.
	mkdir -p go/src/github.com/syncthing/syncthing
	cp $TERMUX_PKG_SRCDIR/vendor/* ./go/src/ -r
	cp $TERMUX_PKG_SRCDIR/*  go/src/github.com/syncthing/syncthing -r

	# Set gopath so dependencies are built as in go get etc.
	export GOPATH=$(pwd)/go

	cd go/src/github.com/syncthing/syncthing

	# Unset GOARCH so building build.go is works.
	export GO_ARCH=$GOARCH
	unset GOOS GOARCH

	# Now file structure is same as go get etc.
	go build build.go
	./build -goos android \
		-goarch $GO_ARCH \
		-no-upgrade \
		-version v$TERMUX_PKG_VERSION \
		build
}

termux_step_make_install() {
	cp go/src/github.com/syncthing/syncthing/syncthing $TERMUX_PREFIX/bin/

	for section in 1 5 7; do
		local MANDIR=$PREFIX/share/man/man$section
		mkdir -p $MANDIR
		cp $TERMUX_PKG_SRCDIR/man/*.$section $MANDIR
	done
}
