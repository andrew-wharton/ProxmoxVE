#!/usr/bin/env bash

# Based on https://documentation.wazuh.com/current/installation-guide/wazuh-agent/wazuh-agent-package-linux.html

# --- Add the Wazuh repository ---

# Install the following packages if missing:
apt-get install gnupg apt-transport-https

# Install the GPG key:
curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | gpg --no-default-keyring --keyring gnupg-ring:/usr/share/keyrings/wazuh.gpg --import && chmod 644 /usr/share/keyrings/wazuh.gpg

# Add the repository:
echo "deb [signed-by=/usr/share/keyrings/wazuh.gpg] https://packages.wazuh.com/4.x/apt/ stable main" | tee -a /etc/apt/sources.list.d/wazuh.list

# Update the package information:
apt-get update

# --- Deploy a Wazuh agent ---
echo "Enter IP or hostname for Wazah Manager: "
read WAZUH_MANAGER
apt-get install wazuh-agent

echo "Wazah Agent installed"

# Enable and start the Wazuh agent service.
systemctl daemon-reload
systemctl enable wazuh-agent
systemctl start wazuh-agent
