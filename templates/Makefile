# $Id$
NAME=vztmpl2
VERSION=0.9.1
TAROPTS=--dereference 

tar:
	CWD=`pwd`; \
	CWD_NAME=`basename $${CWD}`; \
	sed -e "s/@@VERSION@@/$(VERSION)/" < vztmpl.spec.in >vztmpl.spec; \
	cd ..; \
	ln -sf $${CWD_NAME} $(NAME)-$(VERSION); \
	tar $(TAROPTS) -cjf $(NAME)-$(VERSION).tar.bz2 $(NAME)-$(VERSION); \
	tar $(TAROPTS) -czf $(NAME)-$(VERSION).tar.gz  $(NAME)-$(VERSION); \
	rm  $(NAME)-$(VERSION)

rpms:
	rpmbuild --rebuild $(NAME)-$(VERSION).tar.bz2

debs:
