ECUKES = $(shell find elpa/ecukes-*/bin/ecukes | tail -1)
GITDESC = $(shell \
  git describe --tags --match='v[0-9]*\.[0-9]*\.[0-9]*' --abbrev=0)
VERSION = $(patsubst v%,%,$(GITDESC))

all: test package

clean:
	$(RM) loaddefs.el wedge-ws-pkg.el *.elc *~

test:
	cask exec ecukes

wedge-ws-pkg.el:
	cask package
	sed 's%package "wedge-ws" "[^"]*"%package "wedge-ws" "'$(VERSION)'"%'\
		-i $@

package: wedge-ws.el wedge-ws-pkg.el
	ln -s . wedge-ws-$(VERSION) || true
	tar cvf wedge-ws-$(VERSION).tar         \
	  wedge-ws-$(VERSION)/Cask              \
	  wedge-ws-$(VERSION)/Makefile          \
	  wedge-ws-$(VERSION)/README.md         \
	  wedge-ws-$(VERSION)/wedge-ws.el       \
	  wedge-ws-$(VERSION)/wedge-ws-pkg.el
	rm wedge-ws-$(VERSION)
