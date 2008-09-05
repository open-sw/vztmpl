# $Id: Makefile,v 1.5 2005/10/10 15:15:42 kir Exp $
# Makefile to build OS template for use with OpenVZ vzpkg.

include make.defs

SUBDIRS=config

DISTFILE=vztmpl2-$(OSNAME).src.tar.bz2

all: $(SUBDIRS)

$(SUBDIRS):
	make -C $@

install:
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
		-cvjf $(DISTFILE) $(OSNAME)

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
	  -e 's^@@OSNAME@@^$(OSNAME)^'

.PHONY: all config addons rpm install clean clean-subdirs
