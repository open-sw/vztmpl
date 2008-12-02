# $Id$

OSNAME=fedora
OSVERSIONS=7 8 9 10
OSPLATFORMS=7/i386 7/x86_64 8/i386 8/x86_64 9/i386 9/x86_64 10/i386 10/x86_64

C=config
SCRIPTS=$(C)/install-post
CONFIGS=$(C)/default.list $(C)/minimal.list $(C)/small.list $(C)/packager
MACROS=$(C)/.rpmmacros
FILES=$(SCRIPTS) $(CONFIGS) $(GPGKEYS)

all: $(FILES)

clean:

install: all
	install -d -m 755 $(DESTDIR)$(TEMPLATE)/$(OSNAME)/config
	install -m 644 $(CONFIGS) $(DESTDIR)$(TEMPLATE)/$(OSNAME)/config
	install -m 755 $(SCRIPTS) $(DESTDIR)$(TEMPLATE)/$(OSNAME)/config
	for version in $(OSVERSIONS); do \
		install -d $(DESTDIR)$(TEMPLATE)/$(OSNAME)/$${version}/config; \
		install -m 644 $${version}/config/vzpkg.conf $(DESTDIR)$(TEMPLATE)/$(OSNAME)/$${version}/config; \
		install -d $(DESTDIR)$(TEMPLATE)/$(OSNAME)/$${version}/config/gpgkeys; \
		install -m 644 $${version}/config/gpgkeys/* $(DESTDIR)$(TEMPLATE)/$(OSNAME)/$${version}/config/gpgkeys; \
	done
	for platform in $(OSPLATFORMS); do \
		install -d $(DESTDIR)$(TEMPLATE)/$(OSNAME)/$${platform}/config; \
		install -m 644 $(MACROS) $(DESTDIR)$(TEMPLATE)/$(OSNAME)/$${platform}/config; \
	done

.PHONY: install install-gpgkeys clean
.SUFFIXES:
