DIRS=centos fedora debian ubuntu

install:
	for dir in $(DIRS); do \
	       make -C $${dir} DESTDIR=$${DESTDIR} TEMPLATE=$${TEMPLATE} install; \
	done
	
