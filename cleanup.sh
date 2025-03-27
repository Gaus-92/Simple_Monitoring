#!/bin/bash

# Exit immediately if any command fails
set -e

# Stop the Netdata service
echo "Stopping Netdata service..."
sudo systemctl stop netdata

# Remove Netdata
echo "Removing Netdata..."
sudo apt-get remove --purge netdata -y

# Remove configuration files and data
echo "Cleaning up configuration and data files..."
sudo rm -rf /etc/netdata
sudo rm -rf /var/lib/netdata
sudo rm -rf /var/log/netdata

# Display message
echo "Netdata has been completely removed from the system."
