#!/usr/bin/bash
# Set Up Network Routing: To allow the devices connecting to your access point to access the internet, you need to enable IP forwarding and configure NAT with iptables:

# Enable IP forwarding:
sudo sysctl net.ipv4.ip_forward=1

# Configure NAT with iptables: Assuming your internet connection is on eth0, 
# you need to set up NAT to allow devices connected to wlan0 to access the internet.
# Run the following commands to set up NAT:

sudo iptables --table nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo iptables -A FORWARD -i wlan0 -o eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i eth0 -o wlan0 -j ACCEPT

# Make the iptables changes persistent:
# If you want to make the iptables changes persist across reboots, 
# you can save the current iptables rules:

# sudo iptables-save > /etc/iptables/rules.v4


echo "DONE"