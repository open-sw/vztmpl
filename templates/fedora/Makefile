# $Id$

OSNAME=fedora
OSVERSIONS=7/i386 7/x86_64 8/i386 8/x86_64 9/i386 9/x86_64

C=config
SCRIPTS=$(C)/install-post
CONFIGS=$(C)/default.list $(C)/minimal.list $(C)/small.list $(C)/packager $(C)/vzpkg.conf
MACROS=$(C)/.rpmmacros
GPGKEYS=$(C)/gpgkeys/RPM-GPG-KEY-fedora-8-and-9 $(C)/gpgkeys/RPM-GPG-KEY-fedora $(C)/gpgkeys/RPM-GPG-KEY
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
	install -d -m 755 $(DESTDIR)$(TEMPLATE)/$(OSNAME)/7/config
	install -m 644 7/config/vzpkg.conf $(DESTDIR)$(TEMPLATE)/$(OSNAME)/7/config

install-gpgkeys:
	install -d -m 755 $(DESTDIR)$(TEMPLATE)/$(OSNAME)/config/gpgkeys
	install -m 644 $(GPGKEYS) $(DESTDIR)$(TEMPLATE)/$(OSNAME)/config/gpgkeys

.PHONY: install install-gpgkeys clean
.SUFFIXES:
