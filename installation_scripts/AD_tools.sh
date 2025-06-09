#!/bin/bash
set -e

echo "[*] Updating system and installing dependencies..."
sudo apt update && sudo apt install -y golang git mitm6 impacket-scripts bloodhound

echo "[*] Installing Python packages globally (with --break-system-packages)..."
sudo pip3 install --break-system-packages ldapdomaindump ldap3 dnspython

# ---------- KERBRUTE ----------
echo "[*] Installing Kerbrute..."
git clone https://github.com/ropnop/kerbrute.git ~/Downloads/kerbrute
cd ~/Downloads/kerbrute
make linux
sudo mv dist/kerbrute_linux_amd64 /usr/local/bin/kerbrute
sudo chmod +x /usr/local/bin/kerbrute
echo "[✓] Kerbrute installed to /usr/local/bin/kerbrute"

# ---------- PLUMHOUND ----------
echo "[*] Installing PlumHound globally..."
sudo git clone https://github.com/PlumHound/PlumHound.git /opt/PlumHound
sudo pip3 install --break-system-packages -r /opt/PlumHound/requirements.txt

echo -e '#!/bin/bash\npython3 /opt/PlumHound/PlumHound.py "$@"' | sudo tee /usr/local/bin/plumhound > /dev/null
sudo chmod +x /usr/local/bin/plumhound
echo "[✓] PlumHound installed as /usr/local/bin/plumhound"

# ---------- SHARPHOUND COLLECTORS ----------
DEST="/home/kalipen/AD/exec/sharphound"
echo "[*] Downloading SharpHound collectors to $DEST..."
mkdir -p "$DEST"
wget -q https://github.com/BloodHoundAD/BloodHound/releases/latest/download/Collectors.zip -O /tmp/Collectors.zip
unzip -j /tmp/Collectors.zip 'SharpHound.exe' 'SharpHound.ps1' -d "$DEST"
rm /tmp/Collectors.zip
echo "[✓] SharpHound collectors ready in: $DEST"

echo ""
echo "[✔] All AD tools installed globally and ready to use!"
