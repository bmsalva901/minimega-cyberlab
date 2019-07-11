#Simple script to deploy VM in minimega

#At the beginning for every script, assign name space and the following commands
namespace virtLab
optimize ksm true
ns queueing true

###Configuring individual VMs
###pfSense firewall with two interfaces (virtWAN, virtLAN)
clear vm config
vm config disk /opt/minimega/images/pfSense-CE-2.4.4.qcow2 
vm config memory 2048
vm config net virtWAN virtLAN virtDMZ
vm config qemu-append -vga qxl
vm launch kvm pfSense

tap create virtWAN ip 10.0.0.1/30 nat0
dnsmasq start 10.0.0.1 10.0.0.2 10.0.0.1

clear vm config
vm config disk /opt/minimega/images/kali-Linux.qcow2 
vm config memory 2048
vm config net virtLAN
vm config qemu-append -vga qxl
vm launch kvm kali

clear vm config
vm config disk /opt/minimega/images/ubuntuserver.qcow2 
vm config memory 2048
vm config net virtDMZ
vm config qemu-append -vga qxl
vm launch kvm ubuntuServer0
#vm config snapshot false


vm launch
vm start all

