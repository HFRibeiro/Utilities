#!/bin/bash
set -e

# Update package index
sudo apt update

# Install prerequisites
sudo apt install -y curl

# Get the latest Node.js setup script from NodeSource
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -

# Install Node.js (includes npm)
sudo apt install -y nodejs

# Verify installation
echo "Node.js version: $(node -v)"
echo "npm version: $(npm -v)"
