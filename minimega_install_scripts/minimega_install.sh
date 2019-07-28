#!/bin/bash
echo Updating you box...
sudo apt update && sudo apt upgrade -y
sudo apt install git golang openvswitch-switch qemu-kvm qemu-utils dnsmasq ntfs-3g iproute2 libpcap-dev -y 

# Building minimega

echo Downloading minimega, installing and removing deb package...
sudo wget https://storage.googleapis.com/minimega-files/minimega-2.5.deb
sudo dpkg -i minimega-2.5.deb && sudo rm -f minimega-2.5.deb
# Building complete

# install files
echo Adding minimega services and enabling them on startup
sudo cp minimega/minimega.service /etc/systemd/system/minimega.service
sudo cp minimega/miniweb.service /etc/systemd/system/miniweb.service

sudo systemctl enable minimega.service miniweb.service
sudo systemctl start minimega.service miniweb.service

ifconfig
echo '#######################################################################'
echo What is the name of the interface with internet connectivity? see above
echo Example eth0, enp0s31f6, ens1
read intname
sudo ovs-vsctl add-br mega_bridge
sudo ovs-vsctl add-port mega_bridge $intname
sudo ifconfig $intname 0
sudo dhclient mega_bridge

#Move cyberLab folder 
sudo mv cyberLab /opt/minimega/ && rm -r cyberLab

#Making iso directory, downloading pfSense, Kali, and Ubuntu isos
sudo bash download-vms.sh

#starting the cyberLab initial install
echo Starting CyberLab for the first time.
sudo bash /opt/minimega/cyberLab/startLab
