# $Id$

include ../make.defs

SCRIPTS=install-post
CONFIGS=default.list minimal.list packager vzpkg.conf
FILES=$(SCRIPTS) $(CONFIGS)

all: $(FILES)

clean:

install: all
	install -d -m 755 $(DESTDIR)$(TEMPLATE)/$(OSNAME)/config
	install -m 644 $(CONFIGS) $(DESTDIR)$(TEMPLATE)/$(OSNAME)/config
	install -m 755 $(SCRIPTS) $(DESTDIR)$(TEMPLATE)/$(OSNAME)/config
	for version in $(OSVERSIONS); do \
		install -d $(DESTDIR)$(TEMPLATE)/$(OSNAME)/$${version}/config; \
	done

.PHONY: install clean
.SUFFIXES:
