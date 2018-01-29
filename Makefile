PREFIX ?= /usr/x86_64-pc-linux-gnu
DESTDIR ?=
LIBDIR ?= $(PREFIX)/lib
SYSTEMDUNITDIR ?= $(LIBDIR)/systemd/system

all:
	@echo "Nothing to do. Try \"make install\" instead."

install:
	@install -v -d "$(DESTDIR)/$(LIBDIR)/" && install -m 0644 -v exherbo.json "$(DESTDIR)/$(LIBDIR)/exherbo.json"
	@install -v -d "$(DESTDIR)/$(SYSTEMDUNITDIR)/" && install -m 0644 -v org.varlink.resolver.socket "$(DESTDIR)/$(SYSTEMDUNITDIR)/org.varlink.resolver.socket"
	@install -v -d "$(DESTDIR)/$(SYSTEMDUNITDIR)/" && install -m 0644 -v org.varlink.resolver.service "$(DESTDIR)/$(SYSTEMDUNITDIR)/org.varlink.resolver.service"

uninstall:
	@rm -rf \
		"$(DESTDIR)/$(LIBDIR)/exherbo.json" \
		"$(DESTDIR)/$(SYSTEMDUNITDIR)/org.varlink.resolver.service" \
		"$(DESTDIR)/$(SYSTEMDUNITDIR)/org.varlink.resolver.socket"

.PHONY: install uninstall
