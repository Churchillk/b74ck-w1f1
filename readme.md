<!-- to stop dnsmasq do -->
sudo systemctl stop dnsmasq

<!-- Check if dnsmasq is still running: -->
ps aux | grep dnsmasq

<!-- If there is still a running process, stop it or kill it using kill followed by the process ID (PID). -->
<!-- Check for other services using port 67 (which is the DHCP port): -->
sudo lsof -i :67

<!-- stop network manager when DHCP is used by NetworkManager -->
sudo systemctl stop NetworkManager
sudo kill 31923

<!-- make sure ip forwading is on -->
sudo sysctl net.ipv4.ip_forward=1

<!-- To make this change persistent across reboots, add the following line to /etc/sysctl.conf: -->
net.ipv4.ip_forward=1
