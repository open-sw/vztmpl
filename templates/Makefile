DIRS=centos fedora debian ubuntu
SRPMDIR:=$(shell rpm --eval '%{_srcrpmdir}')
RPMDIR:=$(shell rpm --eval '%{_rpmdir}')

install:
	for dir in $(DIRS); do \
	       make -C $${dir} DESTDIR=$(DESTDIR) TEMPLATE=$(TEMPLATE) $@; \
	done
	
rpms:
	mv $(SRPMDIR)/$(NAME)-*$(VERSION)*.src.rpm $(DESTDIR)
	mv $(RPMDIR)/noarch/$(NAME)-*$(VERSION)*.noarch.rpm $(DESTDIR)
