#!bin/bash

echo Downloading pfSense-2.4.4-p3 from: https://nyifiles.pfsense.org/mirror/downloads/pfSense-CE-2.4.4-RELEASE-amd64.iso.gz
echo '##########################################################'
sudo wget https://nyifiles.pfsense.org/mirror/downloads/pfSense-CE-2.4.4-RELEASE-amd64.iso.gz -O /opt/minimega/images/pfSense-CE-2.4.4-RELEASE-amd64.iso.gz
sudo gunzip /opt/minimega/images/pfSense-CE-2.4.4-RELEASE-amd64.iso

echo Downloading Kali 2019.2 from: https://cdimage.kali.org/kali-2019.2/kali-linux-2019.2-amd64.iso
echo '##########################################################'
sudo wget https://images.offensive-security.com/virtual-images/kali-linux-2019.2-vmware-amd64.7z -O /opt/minimega/images/kali-linux-2019.2-vmware-amd64.7z
sudo 7z x kali-linux-2019.2-vmware-amd64.7z
sudo qemu-img convert -f vmdk -O qcow2 /opt/minimega/images/Kali-Linux-2019.2-vmware-amd64/Kali-Linux-2019.2-vmware-amd64.vmdk /opt/minimega/images/kali-linux.qcow2
sudo rm /opt/minimega/images/kali-linux-2019.2-vmware-amd64.7z
sudo rm -r opt/minimega/images/Kali-Linux-2019.2-vmware-amd64

echo Downloading Metaspliot2 from: https://downloads.sourceforge.net/project/metasploitable/Metasploitable2/metasploitable-linux-2.0.0.zip 
echo '##########################################################'

sudo wget https://downloads.sourceforge.net/project/metasploitable/Metasploitable2/metasploitable-linux-2.0.0.zip -O /opt/minimega/images/metasploitable-linux-2.0.0.zip
sudo unzip /opt/minimega/images/metasploitable-linux-2.0.0.zip -d /opt/minimega/images/
sudo rm  /opt/minimega/images/metasploitable-linux-2.0.0.zip
sudo qemu-img convert -f vmdk -O qcow2 /opt/minimega/images/Metasploitable2-Linux/Metasploitable.vmdk /opt/minimega/images/metasploitable.qcow2
sudo rm -r  /opt/minimega/images/Metasploitable2-Linux

