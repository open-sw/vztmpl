# $Id: Makefile,v 1.3 2005/10/10 10:24:02 kir Exp $

include ../make.defs

SCRIPTS=install-post
CONFIGS=default.list minimal.list packager vzpkg.conf
MACROS=.rpmmacros
GPGKEYS=gpgkeys/RPM-GPG-KEY-CentOS-4 gpgkeys/RPM-GPG-KEY-CentOS-5
FILES=$(SCRIPTS) $(CONFIGS) $(GPGKEYS)

all: $(FILES)

clean:

install: all install-gpgkeys
	install -d -m 755 $(DESTDIR)$(TEMPLATE)/$(OSNAME)/config
	install -m 644 $(CONFIGS) $(DESTDIR)$(TEMPLATE)/$(OSNAME)/config
	install -m 755 $(SCRIPTS) $(DESTDIR)$(TEMPLATE)/$(OSNAME)/config
	for version in $(OSVERSIONS); do \
		install -d $(DESTDIR)$(TEMPLATE)/$(OSNAME)/$${version}/config; \
		install -m 644 $(MACROS) $(DESTDIR)$(TEMPLATE)/$(OSNAME)/$${version}/config; \
	done

install-gpgkeys:
	install -d -m 755 $(DESTDIR)$(TEMPLATE)/$(OSNAME)/config/gpgkeys
	install -m 644 $(GPGKEYS) $(DESTDIR)$(TEMPLATE)/$(OSNAME)/config/gpgkeys

.PHONY: install install-gpgkeys clean
.SUFFIXES:
