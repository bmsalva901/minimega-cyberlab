#Simple script to deploy simple setup in minimega

#At the beginning for every script, assign namespace and the following commands
namespace Lab3
optimize ksm true
ns queueing true

#####################################################################################################################
###pfSense firewall/virtual router with three interfaces (WAN, DMZ-5, Marketing-10, Accounting-20)
clear vm config
vm config disk /opt/minimega/images/pfSense.qcow2
vm config memory 2048
vm config net 0 LAN 10 20 5
vm config snapshot true
vm config qemu-append -vga qxl
vm launch kvm pfSense

#####################################################################################################################
###Marketing-10
clear vm config
vm config disk /opt/minimega/images/ubuntu-desktop.qcow2
vm config memory 2048
vm config net LAN
vm config snapshot true
vm config qemu-append -vga qxl
vm launch kvm MGMT

#####################################################################################################################
###Marketing-10
clear vm config
vm config disk /opt/minimega/images/ubuntu-desktop.qcow2
vm config memory 2048
vm config net 10
vm config snapshot true
vm config qemu-append -vga qxl
vm launch kvm Marketing1

clear vm config
vm config disk /opt/minimega/images/ubuntu-desktop.qcow2
vm config memory 2048
vm config net 10
vm config snapshot true
vm config qemu-append -vga qxl
vm launch kvm Marketing2

#####################################################################################################################
###Accounting-20
clear vm config
vm config disk /opt/minimega/images/ubuntu-desktop.qcow2
vm config memory 2048
vm config net 20
vm config snapshot true
vm config qemu-append -vga qxl
vm launch kvm Accounting1

clear vm config
vm config disk /opt/minimega/images/ubuntu-desktop.qcow2
vm config memory 2048
vm config net 20
vm config snapshot true
vm config qemu-append -vga qxl
vm launch kvm Accounting

#####################################################################################################################
###DMZ-5
clear vm config
vm config disk /opt/minimega/images/metasploitable.qcow2
vm config memory 1024
vm config net 5
vm config snapshot true
vm config qemu-append -vga qxl
vm launch kvm WebServer

#####################################################################################################################
vm launch
vm start all

