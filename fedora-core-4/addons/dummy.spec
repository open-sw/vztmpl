Summary: Dummy package to satisfy dependencies for VPS
Name: dummy-fedora-core-4
Group: Applications/System
Vendor: SWsoft
License: GPL
Version: 1.0
Release: 3.swsoft
Autoreq: 0
BuildRoot: %_tmppath/%name-root
Requires: /bin/bash
Provides: kernel = 2.6.9, module-init-tools = 3.1, modutils = 3.1, mingetty
Provides: kernel-utils, ethtool
# For xorg-x11 (bug #74)
Provides: kernel-drm = 4.3.0

%description
Dummy package to satisfy dependencies inside a VPS.

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/tmp
#cp $RPM_SOURCE_DIR/%SOURCE0 $RPM_BUILD_ROOT/tmp 
touch $RPM_BUILD_ROOT/tmp/%name-file 
chmod 666 $RPM_BUILD_ROOT/tmp/%name-file 
mkdir -p $RPM_BUILD_ROOT/sbin

# create link to fix insmod, modprobe and lsmod calls in /etc/init.d/iptables
for i in insmod lsmod modprobe insmod.static nash; do
    	ln -s /bin/true $RPM_BUILD_ROOT/sbin/$i
done

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
/sbin/insmod
/sbin/insmod.static
/sbin/lsmod
/sbin/modprobe
/sbin/nash
/tmp/%name-file

%changelog
* Mon Nov 21 2005 Kir Kolyshkin <kir@sw.ru> 1.0-3.swsoft
- added kernel-drm provides (needed for xorg-x11, bug #74)

* Tue Jun 21 2005 Kir Kolyshkin <kir@sw.ru> 1.0-2.swsoft
- porting to FC4
- provides /sbin/nash, ethtool for FC4 initscripts

* Mon Feb 07 2005 Konstantin Volckov <wolf@sw.ru> 1.0-1.swsoft
- First build for fc3
