#!/bin/bash

# Exit immediately if any command fails
set -e

# Display message
echo "Starting to test the system load for Netdata monitoring..."

# Stress CPU - Run CPU-heavy processes
echo "Generating CPU load..."
stress --cpu 4 --timeout 60 &

# Stress memory - Allocate and use memory
echo "Generating memory load..."
stress --vm 2 --vm-bytes 1G --timeout 60 &

# Stress disk - Generate disk I/O load
echo "Generating disk I/O load..."
dd if=/dev/zero of=testfile bs=1M count=1024 oflag=direct &

# Wait for the load generation to complete
sleep 60

# Display message
echo "System load generated. You should now see the metrics on the Netdata dashboard."
echo "Check the Netdata dashboard at http://<your-server-ip>:19999"
