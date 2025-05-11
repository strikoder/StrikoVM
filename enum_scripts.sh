#!/bin/bash

# Enumeration Script Downloader (Linux + Windows)
set -e

DEST_DIR=~/strikodot/localenum
mkdir -p "$DEST_DIR"
cd "$DEST_DIR"

echo -e "\n[+] Downloading Linux enumeration tools..."

# linPEAS
wget -q https://github.com/peass-ng/PEASS-ng/releases/latest/download/linpeas_linux_amd64 -O linpeas.sh

# linux-exploit-suggester
wget -q https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh -O linuxexploitsuggester.sh

# LinEnum
wget -q https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh -O LinEnum.sh

# linuxprivchecker
wget -q https://raw.githubusercontent.com/sleventyeleven/linuxprivchecker/master/linuxprivchecker.py -O linuxprivchecker.py

echo -e "\n[+] Downloading Windows enumeration tools..."

# winPEAS
wget -q https://github.com/peass-ng/PEASS-ng/releases/latest/download/winPEASx64.exe -O winPEASx64.exe
wget -q https://github.com/peass-ng/PEASS-ng/releases/latest/download/winPEAS.bat -O winPEAS.bat

# JAWS
wget -q https://raw.githubusercontent.com/411Hall/JAWS/master/jaws-enum.ps1 -O jaws-enum.ps1

# PrivescCheck
wget -q https://raw.githubusercontent.com/itm4n/PrivescCheck/master/PrivescCheck.ps1 -O PrivescCheck.ps1

# PowerSploit
mkdir -p PowerSploit
git clone --depth=1 https://github.com/PowerShellMafia/PowerSploit.git PowerSploit

echo -e "\n[!] Manual step required:"
echo -e "    🔸 Compile SharpUp from: https://github.com/GhostPack/SharpUp"
echo -e "    🔸 Compile Seatbelt from: https://github.com/GhostPack/Seatbelt"

echo -e "\n[✓] Enumeration tools downloaded to $DEST_DIR"
