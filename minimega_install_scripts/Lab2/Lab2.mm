#Simple script to deploy simple setup in minimega

#At the beginning for every script, assign namespace and the following commands
namespace Lab2
optimize ksm true
ns queueing true

###Kali
clear vm config
vm config disk /opt/minimega/images/Kali-Linux.qcow2
vm config memory 2048
vm config net 0
vm config snapshot true
vm config qemu-append -vga qxl
vm launch kvm Kali1

###Kali
clear vm config
vm config disk /opt/minimega/images/Kali-Linux.qcow2
vm config memory 2048
vm config net 0
vm config snapshot true
vm config qemu-append -vga qxl
vm launch kvm Kali2

###Kali
clear vm config
vm config disk /opt/minimega/images/Kali-Linux.qcow2
vm config memory 2048
vm config net 0
vm config snapshot true
vm config qemu-append -vga qxl
vm launch kvm Kali3

###Kali
clear vm config
vm config disk /opt/minimega/images/Kali-Linux.qcow2
vm config memory 2048
vm config net 0
vm config snapshot true
vm config qemu-append -vga qxl
vm launch kvm Kali4


vm launch
vm start all

