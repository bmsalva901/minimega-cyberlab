ifconfig
echo '#######################################################################'
echo What is the name of the interface with internet connectivity? see above
echo Example eth0, enp0s31f6, ens1
read intname
sudo ovs-vsctl add-br mega_bridge
sudo ovs-vsctl add-port mega_bridge $intname
sudo ifconfig $intname 0
sudo dhclient mega_bridge
