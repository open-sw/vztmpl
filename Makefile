# $Id$
NAME=vztmpl2
VERSION=0.9.1
TAROPTS=--dereference

tar:
	sed -e "s/@@VERSION@@/$(VERSION)/" < templates/vztmpl.spec.in > templates/vztmpl.spec; \
	ln -sf templates $(NAME)-$(VERSION); \
	tar $(TAROPTS) -cjf $(NAME)-$(VERSION).tar.bz2 $(NAME)-$(VERSION); \
	tar $(TAROPTS) -czf $(NAME)-$(VERSION).tar.gz  $(NAME)-$(VERSION); \
	rm  $(NAME)-$(VERSION)

rpms: tar
	rpmbuild -v -ta $(NAME)-$(VERSION).tar.bz2

debs:
	fakeroot dpkg-buildpackage -I.git

.PHONY: tar rpms debs
