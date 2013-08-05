ECUKES = $(shell find elpa/ecukes-*/bin/ecukes | tail -1)
GITDESC = $(shell \
  git describe --tags --match='v[0-9]*\.[0-9]*\.[0-9]*' --abbrev=0)
VERSION = $(patsubst v%,%,$(GITDESC))

all: test package

test:
	carton exec ${ECUKES} features

package:
	carton package
	ln -s . wedge-ws-$(VERSION) || true
	tar cvf wedge-ws-$(VERSION).tar       \
	  wedge-ws-$(VERSION)/Carton          \
	  wedge-ws-$(VERSION)/features        \
	  wedge-ws-$(VERSION)/Makefile        \
	  wedge-ws-$(VERSION)/README.md       \
	  wedge-ws-$(VERSION)/wedge-ws.el     \
	  wedge-ws-$(VERSION)/wedge-ws-pkg.el
	rm wedge-ws-$(VERSION)
