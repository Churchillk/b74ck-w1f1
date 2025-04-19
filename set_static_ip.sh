#!/bin/bash
echo "Setting static IP for wlan1..."

# Bring down interface
sudo ip link set wlan1 down

# Set static IP
sudo ip addr flush dev wlan1
sudo ip addr add 192.168.1.1/24 dev wlan1

# Bring it up
sudo ip link set wlan1 up

echo "✓ wlan1 now has IP 192.168.1.1"

# bring iface up 
sudo ip link set wlan1 up

#  And if you're assigning a static IP (as in your AP setup), do that first: --
sudo ip addr flush dev wlan1
sudo ip addr add 192.168.1.1/24 dev wlan1