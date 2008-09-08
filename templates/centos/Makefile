# $Id$

OSNAME=centos
OSVERSIONS=4/i386 4/x86_64 5/i386 5/x86_64

C=config
SCRIPTS=$(C)/install-post
CONFIGS=$(C)/default.list $(C)/minimal.list $(C)/packager $(C)/vzpkg.conf
MACROS=$(C)/.rpmmacros
GPGKEYS=$(C)/gpgkeys/RPM-GPG-KEY-CentOS-4 $(C)/gpgkeys/RPM-GPG-KEY-CentOS-5
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
