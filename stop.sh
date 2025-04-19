#!/bin/bash

echo "Disabling and stopping network-related services..."

# Stop and disable dnsmasq (default system service)
if systemctl list-unit-files | grep -q '^dnsmasq.service'; then
    sudo systemctl stop dnsmasq
    sudo systemctl disable dnsmasq
    echo "✓ dnsmasq stopped and disabled"
fi

# Stop and disable systemd-resolved (default DNS service)
if systemctl list-unit-files | grep -q '^systemd-resolved.service'; then
    sudo systemctl stop systemd-resolved
    sudo systemctl disable systemd-resolved
    echo "✓ systemd-resolved stopped and disabled"
fi

# Stop and disable NetworkManager (if not needed)
if systemctl list-unit-files | grep -q '^NetworkManager.service'; then
    sudo systemctl stop NetworkManager
    sudo systemctl disable NetworkManager
    echo "✓ NetworkManager stopped and disabled"
fi

# Optionally tell NetworkManager not to mess with DNS (if it's still around)
NM_CONF="/etc/NetworkManager/NetworkManager.conf"
if [ -f "$NM_CONF" ]; then
    sudo sed -i 's/^#dns=none/dns=none/' "$NM_CONF"
    echo "✓ Set NetworkManager to ignore DNS"
    sudo systemctl restart NetworkManager
fi

echo "All relevant services disabled!"
