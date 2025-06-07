#!/bin/bash
set -e

echo "[*] Updating packages and installing dependencies..."
sudo apt update && sudo apt install -y golang git unzip wget make amass findomain

echo "[*] Ensuring Go paths are set..."
echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.bashrc
export PATH=$PATH:$(go env GOPATH)/bin

echo "[*] Installing subfinder..."
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

echo "[*] Installing dnsx..."
go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest

echo "[*] Installing httpx..."
go install github.com/projectdiscovery/httpx/cmd/httpx@latest

echo "[*] Downloading and installing aquatone..."
wget https://github.com/michenriksen/aquatone/releases/latest/download/aquatone_linux_amd64.zip -O /tmp/aquatone.zip
unzip -q /tmp/aquatone.zip -d /tmp/aquatone
sudo mv /tmp/aquatone/aquatone /usr/local/bin/
sudo chmod +x /usr/local/bin/aquatone
rm -rf /tmp/aquatone*

echo ""
echo "[✔] All recon tools installed successfully!"
echo "Make sure to reload your shell or run: source ~/.bashrc"
