# $Id$
#

NAME=vz-dummy
DESTDIR=.
SRPMDIR:=$(shell rpm --eval '%{_srcrpmdir}')
RPMDIR:=$(shell rpm --eval '%{_rpmdir}')

rpms:
	sed -e "s/@@VERSION@@/$(VERSION)/" < $(NAME).spec.in > $(NAME).spec; \
	SRCRPM=`rpm --define='dist %{nil}' -q --queryformat='%{name}-%{version}-%{release}.src.rpm\n' --specfile $(NAME).spec | head -1`; \
	rpmbuild --define='dist %{nil}' -bs $(NAME).spec; \
	mv $(SRPMDIR)/$${SRCRPM} $(DESTDIR)

addons:
	sed -e "s/@@VERSION@@/$(VERSION)/" < $(NAME).spec.in > $(NAME).spec; \
	RPMS=`rpm -q --specfile $(NAME).spec`; \
	rpmbuild -bb $(NAME).spec; \
	for file in $${RPMS}; do \
		mv $(RPMDIR)/*/$${file}*.rpm $(DESTDIR); \
	done

clean:

.PHONY: rpms clean
.SUFFIXES:

