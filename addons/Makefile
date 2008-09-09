# $Id$
#

DIRS=vz-dummy vz-MAKEDEV
DESTDIR=.

rpms addons:
	for dir in $(DIRS); do \
		$(MAKE) -C $${dir} DESTDIR=$(DESTDIR) VERSION=$(VERSION) $@; \
	done

