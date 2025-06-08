#!/bin/bash
set -e

# ---------- SYSTEM DEPENDENCIES ----------
echo "[*] Installing mitm6, Impacket, Go ..."
sudo apt update && sudo apt install -y golang mitm6 impacket-scripts unzip wget make python3-pip bloodhound
echo "[✓] Core dependencies installed"

# ---------- KERBRUTE ----------
echo "[*] Installing Kerbrute..."
git clone https://github.com/ropnop/kerbrute.git ~/Downloads/kerbrute
cd ~/Downloads/kerbrute
make linux
sudo mv dist/kerbrute_linux_amd64 /usr/local/bin/kerbrute
sudo chmod +x /usr/local/bin/kerbrute
echo "[✓] Kerbrute installed to /usr/local/bin/kerbrute"

# ---------- PLUMHOUND ----------
echo "[*] Installing PlumHound..."
sudo git clone https://github.com/PlumHound/PlumHound.git /opt/PlumHound
sudo pip3 install -r /opt/PlumHound/requirements.txt
echo -e '#!/bin/bash\npython3 /opt/PlumHound/PlumHound.py "$@"' | sudo tee /usr/local/bin/plumhound > /dev/null
sudo chmod +x /usr/local/bin/plumhound
echo "[✓] PlumHound installed as /usr/local/bin/plumhound"

# ---------- SHARPHOUND COLLECTORS ----------
DEST="/home/kalipen/AD/exec/sharphound"
echo "[*] Setting up SharpHound collectors in $DEST..."
mkdir -p "$DEST"
wget -q https://github.com/BloodHoundAD/BloodHound/releases/latest/download/Collectors.zip -O /tmp/Collectors.zip
unzip -j /tmp/Collectors.zip 'SharpHound.exe' 'SharpHound.ps1' -d "$DEST"
rm /tmp/Collectors.zip
echo "[✓] SharpHound collectors downloaded to: $DEST"

echo ""
echo "[✔] All AD tools installed and configured successfully!"
