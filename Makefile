# $Id$
#

NAME=vztmpl2
VERSION=0.9.1
TAROPTS=--dereference
DESTDIR:=$(shell pwd)/dist

$(DESTDIR):
	mkdir $@

$(DESTDIR)/templates: $(DESTDIR)
	mkdir $@

$(DESTDIR)/addons: $(DESTDIR)
	mkdir $@

tar: $(DESTDIR)/templates $(DESTDIR)/addons
	sed -e "s/@@VERSION@@/$(VERSION)/" < templates/vztmpl.spec.in > templates/vztmpl.spec; \
	ln -sf templates $(NAME)-$(VERSION); \
	tar $(TAROPTS) -cjf $(DESTDIR)/templates/$(NAME)-$(VERSION).tar.bz2 $(NAME)-$(VERSION); \
	tar $(TAROPTS) -czf $(DESTDIR)/templates/$(NAME)-$(VERSION).tar.gz  $(NAME)-$(VERSION); \
	rm  $(NAME)-$(VERSION)

rpms: tar
	$(MAKE) -C addons DESTDIR=$(DESTDIR)/addons VERSION=$(VERSION) $@
	rpmbuild -ta $(DESTDIR)/templates/$(NAME)-$(VERSION).tar.bz2
	$(MAKE) -C templates NAME=$(NAME) DESTDIR=$(DESTDIR)/templates VERSION=$(VERSION) $@

debs:
	fakeroot dpkg-buildpackage -I.git

addons:
	$(MAKE) -C addons DESTDIR=$(DESTDIR)/addons VERSION=$(VERSION) $@

.PHONY: tar rpms debs addons dist
