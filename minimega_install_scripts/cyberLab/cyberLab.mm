
#Simple script to deploy simple setup in minimega

#At the beginning for every script, assign namespace and the following commands
namespace cyberLab
optimize ksm true
ns queueing true

###Configuring individual VMs
###pfSense firewall with two interfaces (WAN, LAN)
clear vm config
disk create qcow2 /opt/minimega/images/pfSense-CE-2.4.4.qcow2 20G
vm config disk /opt/minimega/images/pfSense-CE-2.4.4.qcow2
vm config cdrom /opt/minimega/images/pfSense-CE-2.4.4-RELEASE-amd64.iso 
vm config memory 2048
vm config net 0 LAN
vm config snapshot false
vm config qemu-append -vga qxl
vm launch kvm pfSense

###Kali
clear vm config
vm config disk /opt/minimega/images/kali-linux.qcow2
vm config memory 2048
vm config net LAN
vm config snapshot true
vm config qemu-append -vga qxl
vm launch kvm Kali

clear vm config
vm config disk /opt/minimega/images/metasploitable.qcow2
vm config memory 1024
vm config net LAN
vm config snapshot true
vm config qemu-append -vga qxl
vm launch kvm Metasploitable


vm launch
vm start all

