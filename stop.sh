#!/usr/bin/bash
sudo systemctl stop dnsmasq
ps aux | grep dnsmasq
sudo lsof -i :67
sudo systemctl stop dnsmasq
sudo systemctl disable dnsmasq
sudo fuser -k 67/udp