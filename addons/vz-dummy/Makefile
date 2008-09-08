# $Id: Makefile,v 1.1 2005/06/21 08:12:03 kir Exp $
# Build RPMS needed for vz-addons
#
# Caveats:
#
#  1. You have to specify SOURCES explicitly
#
#  2. If you change some file from SOURCES without changing its name,
#     no single RPM will be rebuild. In other words, there are no make
#     dependencies on files listed in 'Source:' lines in .spec files.
#
# Still, it works for me (TM).

# "grep -v -- '$(SKIPRPMS)'" is used below
# to filter out those not needed RPMS
SKIPRPMS=-debuginfo-

all: $(DYNMF) repo

include $(DYNMF)

$(CPSRC): $(SOURCES)
	cp -f $(SOURCES) $(RPMSRCDIR)
	touch $(CPSRC)

list-rpms:
	@echo "$(ALLRPMS)"

$(DYNMF): $(SPECS) Makefile
	rpmbuild --target=i386 -ba $$S" >> $@; \
	echo -e "\tmv -f $(RPMDIR)/$$ARCH/$$R ." >> $@; \

install:
	install -d $(DESTDIR)$(TEMPLATE)/$(OSNAME)/$${version}/vz-addons; \
	install -m 644 $(ALLRPMS) $(DESTDIR)$(TEMPLATE)/$(OSNAME)/$${version}/vz-addons; \

clean:

.PHONY: list-rpms all clean
.SUFFIXES:

