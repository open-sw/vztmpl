Summary: Dummy package to satisfy dependencies for VPS
Name: dummy-centos
Group: Applications/System
Vendor: SWsoft
License: GPL
Version: 0.9.0
Release: 1
Autoreq: 0
BuildRoot: %_tmppath/%name-root
Requires: /bin/bash
Provides: module-init-tools, modutils, kernel-utils
Provides: ethtool, mingetty, udev
# For xorg-x11 (http://bugzilla.openvz.org/74)
Provides: kernel-drm

%description
Dummy package to satisfy dependencies inside a VE

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/tmp
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
* Wed Dec 14 2005 Kir Kolyshkin <kir-at-openvz.org> 1.0-3.swsoft
- added kernel-drm provides (needed for xorg-x11, bug #74)

* Tue Jun 21 2005 Kir Kolyshkin <kir@sw.ru> 1.0-2.swsoft
- porting to FC4
- provides /sbin/nash, ethtool for FC4 initscripts

* Mon Feb 07 2005 Konstantin Volckov <wolf@sw.ru> 1.0-1.swsoft
- First build for fc3
