# $Id$
#

NAME=vz-MAKEDEV
DESTDIR=.
SRCDIR:=$(shell rpm --eval '%{_sourcedir}')
SRCTAR=MAKEDEV-3.3.13-1.tar.gz
SRPMDIR:=$(shell rpm --eval '%{_srcrpmdir}')
RPMDIR:=$(shell rpm --eval '%{_rpmdir}')

rpms:
	sed -e "s/@@VERSION@@/$(VERSION)/" < $(NAME).spec.in > $(NAME).spec
	SRCRPM=$(shell rpm --define='dist %{nil}' -q --queryformat='%{name}-%{version}-%{release}.src.rpm\n' --specfile $(NAME).spec | head -1); \
	cp $(SRCTAR) $(SRCDIR); \
	rpmbuild --define='dist %{nil}' -bs $(NAME).spec; \
	rm $(SRCDIR)/$(SRCTAR); \
	mv $(SRPMDIR)/$${SRCRPM} $(DESTDIR)

addons:
	sed -e "s/@@VERSION@@/$(VERSION)/" < $(NAME).spec.in > $(NAME).spec; \
	RPMS="$(shell rpm -q --specfile $(NAME).spec)"; \
	cp $(SRCTAR) $(SRCDIR); \
	rpmbuild -bb $(NAME).spec; \
	for file in $${RPMS}; do \
		mv $(RPMDIR)/*/$${file}*.rpm $(DESTDIR); \
	done

clean:

.PHONY: rpms clean
.SUFFIXES:

