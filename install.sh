#!/bin/bash

# Install required packages
sudo dnf install network-scripts -y

# Disable and stop firewalld
sudo systemctl disable firewalld
sudo systemctl stop firewalld

# Disable NetworkManager and enable network
sudo systemctl disable NetworkManager
sudo systemctl stop NetworkManager
sudo systemctl enable network
sudo systemctl start network

# Enable PowerTools repository
sudo dnf config-manager --enable powertools

# Install OpenStack packages
sudo dnf install -y centos-release-openstack-yoga
sudo dnf update -y
sudo dnf install -y openstack-packstack

# disble the selinux
sudo setenforce 0

# Run Packstack to set up OpenStack (password is set to '1' if prompted)
#echo "1" | sudo packstack --allinone
packstack --allinone --os-neutron-l2-agent=openvswitch --os-neutron-ml2-mechanism-drivers=openvswitch --os-neutron-ml2-tenant-network-types=vxlan --os-neutron-ml2-type-drivers=vxlan,flat --provision-demo=n --os-neutron-ovs-bridge-mappings=extnet:br-ex --os-neutron-ovs-bridge-interfaces=br-ex:enp0s3


echo " ***     **  ::  ::::::::::::  **       **  ::  ***     **  "
echo " ****    **  **       **       **       **  **  ****    **  "
echo " **  **  **  **       **       **:::::::**  **  **  **  **  "
echo " **   ** **  **       **       **       **  **  **   ** **  "
echo " **    ****  **       **       **       **  **  **    ****  "

echo "🚀 OpenStack ☁️☁️☁️ setup completed using Packstack by 🤖🤖Nithin's Bash script! 🎉"
echo " 👽👽Installtion is done✅"
echo "🟢🟢😊😊😊😊😊😊😊🟢🟢"
