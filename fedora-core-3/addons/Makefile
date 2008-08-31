# $Id: Makefile,v 1.1 2005/06/08 08:43:54 kir Exp $
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

SPECS=dummy.spec MAKEDEV.spec
SOURCES=*.tar.gz

include ../make.defs

SPEC2RPMNAME=rpm -q --queryformat \
  '%{name}-%{version}-%{release}.%{arch}.rpm ' --specfile
SPEC2DIRRPMNAME=rpm -q --queryformat \
  '%{arch}/%{name}-%{version}-%{release}.%{arch}.rpm ' --specfile

RPMDIR=$(shell rpm --eval "%{_rpmdir}")
RPMSRCDIR=$(shell rpm --eval "%{_sourcedir}")
SRPMDIR=$(shell rpm --eval "%{_srcrpmdir}")

# "grep -v -- '$(SKIPRPMS)'" is used below
# to filter out those not needed RPMS
SKIPRPMS=-debuginfo-

DYNMF=.makerpms
CPSRC=.copy-sources

ALLRPMS=$(shell for S in $(SPECS); do $(SPEC2RPMNAME) $$S; done | \
  tr ' ' '\n' | grep -v -- '$(SKIPRPMS)')

all: $(DYNMF) repo

$(ALLRPMS): $(CPSRC)

include $(DYNMF)

$(CPSRC): $(SOURCES)
	cp -f $(SOURCES) $(RPMSRCDIR)
	touch $(CPSRC)

list-rpms:
	@echo "$(ALLRPMS)"

$(DYNMF): $(SPECS) Makefile
	echo -n > $@
	for S in $(SPECS); do \
		RPMS="`$(SPEC2RPMNAME) $$S`"; \
		for R in $$RPMS; do \
			echo $$R | fgrep -q -- '$(SKIPRPMS)' && continue; \
			echo -e "$$R: $$S\n" >> $@; \
		done; \
		echo -e "$$RPMS:\n\trpmbuild -ba $$S" >> $@; \
		for R in $$RPMS; do \
			echo $$R | fgrep -q -- '$(SKIPRPMS)' && continue; \
			ARCH=`echo $$R | awk -F . '{print $$(NF-1)}'`; \
			echo -e "\tmv -f $(RPMDIR)/$$ARCH/$$R ." >> $@; \
		done; \
		echo >> $@; \
	done

repo: $(ALLRPMS)
	createrepo .

install: repo
	install -d $(DESTDIR)$(MYTADDONSDIR)
	install -m 644 $(ALLRPMS) $(DESTDIR)$(MYTADDONSDIR)/
	install -d $(DESTDIR)$(MYTADDONSDIR)/repodata/
	install -m 644 repodata/* $(DESTDIR)$(MYTADDONSDIR)/repodata/

clean:
	rm -f $(DYNMF) $(ALLRPMS) $(CPSRC)
	rm -rf repodata

.PHONY: list-rpms all clean
.SUFFIXES:

