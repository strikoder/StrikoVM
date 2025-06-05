#!/bin/bash
set -e

# Install dependencies
sudo apt update && sudo apt install -y golang mitm6 impacket-scripts
echo "[✓] mitm6 & impacket-scripts installed"

# Clone kerbrute repo
git clone https://github.com/ropnop/kerbrute.git ~/Downloads/kerbrute
# Build kerbrute
cd ~/Downloads/kerbrute
make linux
# Move binary to PATH
sudo mv dist/kerbrute_linux_amd64 /usr/local/bin/kerbrute
sudo chmod +x /usr/local/bin/kerbrute

echo "[✓] kerbrute installed to /usr/local/bin/kerbrute"
