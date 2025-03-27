import subprocess

# Start hostapd
subprocess.run(['sudo', 'hostapd', './hostapd.conf'])

# Start dnsmasq
subprocess.run(['sudo', 'dnsmasq', '-C', './dnsmasq.conf'])
