#!/bin/bash

echo "Re-enabling and restarting network-related services..."

# Enable and start dnsmasq (if installed)
if systemctl list-unit-files | grep -q '^dnsmasq.service'; then
    sudo systemctl enable dnsmasq
    sudo systemctl start dnsmasq
    echo "✓ dnsmasq enabled and started"
fi

# Enable and start systemd-resolved (used for DNS resolution)
if systemctl list-unit-files | grep -q '^systemd-resolved.service'; then
    sudo systemctl enable systemd-resolved
    sudo systemctl start systemd-resolved
    echo "✓ systemd-resolved enabled and started"
fi

# Enable and restart NetworkManager (for general network control)
if systemctl list-unit-files | grep -q '^NetworkManager.service'; then
    sudo systemctl enable NetworkManager
    sudo systemctl restart NetworkManager
    echo "✓ NetworkManager enabled and restarted"
fi

# Optionally fix NetworkManager config (re-enable DNS if disabled before)
NM_CONF="/etc/NetworkManager/NetworkManager.conf"
if [ -f "$NM_CONF" ]; then
    sudo sed -i 's/^dns=none/#dns=none/' "$NM_CONF"
    echo "✓ Reset NetworkManager DNS settings"
    sudo systemctl restart NetworkManager
fi

echo "All relevant services re-enabled!"
