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

# Run Packstack to set up OpenStack (password is set to '1' if prompted)
echo "1" | sudo packstack --allinone
