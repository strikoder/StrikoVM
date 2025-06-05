#!/bin/bash

# --- Step 1: Install Extra Tools Not in Base Kali ---
echo -e "\n[+] Installing extra tools from GitHub..."

# rustscan
if ! command -v rustscan &>/dev/null; then
  echo "[+] Installing rustscan..."
  RUSTSCAN_URL=$(curl -s https://api.github.com/repos/RustScan/RustScan/releases/latest | grep browser_download_url | grep amd64.deb | cut -d '"' -f 4)
  wget "$RUSTSCAN_URL" -O rustscan.deb
  sudo dpkg -i rustscan.deb || sudo apt -f install -y
  rm rustscan.deb
fi
