# $Id: Makefile,v 1.5 2005/10/25 11:19:36 kir Exp $

include ../make.defs

SCRIPTS=install-post install-pre update-post
CONFIGS=yum.conf default.list minimal.list rpm .rpmmacros
GPGKEYS=gpgkeys/RPM-GPG-KEY-fedora gpgkeys/RPM-GPG-KEY
FILES=$(SCRIPTS) $(CONFIGS) $(GPGKEYS)

all: $(FILES)

yum.conf: yum.conf.in
	cat $< | sed -e 's^@@TEMPLATE@@^$(TEMPLATE)^' \
	  -e 's^@@MYTDIR@@^$(MYTDIR)^' \
	  -e 's^@@MYTCONFIGDIR@@^$(MYTCONFIGDIR)^' \
	  -e 's^@@MYTADDONSDIR@@^$(MYTADDONSDIR)^' \
	  -e 's^@@OSVERSION@@^$(OSVERSION)^' \
	  -e 's^@@OSARCH@@^$(OSARCH)^' \
	  > $@

clean:
	rm -f yum.conf

install: all install-gpgkeys
	install -d -m 755 $(DESTDIR)$(MYTCONFIGDIR)
	install -m 644 $(CONFIGS) $(DESTDIR)$(MYTCONFIGDIR)
	install -m 755 $(SCRIPTS) $(DESTDIR)$(MYTCONFIGDIR)

install-gpgkeys:
	install -d -m 755 $(DESTDIR)$(MYTCONFIGDIR)/gpgkeys
	install -m 644 $(GPGKEYS) $(DESTDIR)$(MYTCONFIGDIR)/gpgkeys

.PHONY: install install-gpgkeys clean
.SUFFIXES:
