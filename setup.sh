#!/bin/bash

# Exit immediately if any command fails
set -e

# Update the system
echo "Updating system packages..."
sudo apt-get update -y
sudo apt-get upgrade -y

# Install dependencies
echo "Installing dependencies..."
sudo apt-get install -y curl wget

# Install Netdata
echo "Installing Netdata..."
bash <(curl -Ss https://my-netdata.io/kickstart.sh)

# Start Netdata service
echo "Starting Netdata service..."
sudo systemctl start netdata
sudo systemctl enable netdata

# Print message with access information
echo "Netdata installation complete. You can access the dashboard at http://<your-server-ip>:19999"
