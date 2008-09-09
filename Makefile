# $Id$
#

NAME=vztmpl2
VERSION=0.9.2
TAROPTS=--dereference
DESTDIR:=$(shell pwd)/../dist

$(DESTDIR):
	test -d $@ || mkdir $@

$(DESTDIR)/templates: $(DESTDIR)
	test -d $@ || mkdir $@

$(DESTDIR)/addons: $(DESTDIR)
	test -d $@ || mkdir $@

$(DESTDIR)/debian: $(DESTDIR)
	test -d $@ || mkdir $@

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

debs: $(DESTDIR)/debian
	fakeroot dpkg-buildpackage -I.git -sgpg -kdministrator@opensource-sw.net
	mv ../vztmpl2*_$(VERSION)* $(DESTDIR)/debian

addons:
	$(MAKE) -C addons DESTDIR=$(DESTDIR)/addons VERSION=$(VERSION) $@

.PHONY: tar rpms debs addons dist
