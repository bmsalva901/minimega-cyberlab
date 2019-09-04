#!/bin/bash
echo Updating your box...
sudo apt update && sudo apt upgrade -y
sudo apt install git golang openvswitch-switch qemu-kvm qemu-utils dnsmasq ntfs-3g iproute2 libpcap-dev unzip p7zip-full -y 

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
