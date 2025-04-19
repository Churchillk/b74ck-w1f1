import subprocess

# Start hostapd
hostapd_process = subprocess.Popen(['sudo', 'hostapd', './hostapd.conf'])

# Start dnsmasq
dnsmasq_process = subprocess.Popen(['sudo', 'dnsmasq', '-C', './dnsmasq.conf'])

# Optional: Wait for both processes if you want your script to hold execution
hostapd_process.wait()
dnsmasq_process.wait()
