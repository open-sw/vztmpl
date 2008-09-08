DIRS=centos fedora debian ubuntu

install:
	for dir in $(DIRS); do \
	       make -C $${dir} DESTDIR=$${RPM_BUILD_ROOT} TEMPLATE=$${TEMPLATE} install; \
	done
	
