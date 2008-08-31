# $Id: Makefile,v 1.6 2005/10/18 08:36:22 kir Exp $
# Makefile to build OS template for use with OpenVZ vzpkg.

include make.defs

SUBDIRS=config addons

DISTFILE=vztmpl-$(OSNAME)-$(OSVERSION).src.tar.bz2

all: $(SUBDIRS)

$(SUBDIRS):
	make -C $@

install-yumdir:
	install -d $(DESTDIR)$(MYTDIR)/yum-cache

install: install-yumdir
	for D in $(SUBDIRS); do \
		make -C $$D $@; \
	done

clean-subdirs:
	for D in $(SUBDIRS); do \
		make -C $$D clean; \
	done

clean: clean-subdirs
	rm -f vztmpl.spec
	rm -f $(DISTFILE)

dist: $(DISTFILE)

$(DISTFILE): clean-subdirs
	tar -C .. --exclude CVS --exclude $(DISTFILE) \
		--exclude \*.diff --exclude .cvsignore \
		-cvjf $(DISTFILE) $(OSNAME)-$(OSVERSION)

rpms: clean-subdirs vztmpl.spec dist
	RPMSRCDIR=`rpm --eval "%{_sourcedir}"` && \
	cp $(DISTFILE) $$RPMSRCDIR && \
	rpmbuild -ba vztmpl.spec

srpm: clean-subdirs vztmpl.spec dist
	RPMSRCDIR=`rpm --eval "%{_sourcedir}"` && \
	cp $(DISTFILE) $$RPMSRCDIR && \
	rpmbuild -bs vztmpl.spec

vztmpl.spec: vztmpl.spec.in
	sed < $< > $@ \
	  -e 's^@@OSNAME@@^$(OSNAME)^' \
	  -e 's^@@OSVERSION@@^$(OSVERSION)^' \
	  -e 's^@@OSARCH@@^$(OSARCH)^'

.PHONY: all config addons rpm install clean clean-subdirs
