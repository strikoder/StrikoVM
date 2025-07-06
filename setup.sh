#!/bin/bash
set -e

# --- Step -1: Make setup location-aware ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# --- Step 0: Create Workspace Directory ---
echo -e "\n[+] Creating ~/kalipen directory..."
mkdir -p ~/kalipen

# --- Step 1: Install Basic Packages ---
echo -e "\n[+] Installing Basic Packages..."
bash "$SCRIPT_DIR/installation_scripts/basic_tools.sh"

# --- Step 2: Download Linux & Windows Enumeration Scripts ---
echo -e "\n[+] Downloading Linux and Windows enumeration scripts..."
bash "$SCRIPT_DIR/installation_scripts/privesc_enum_scripts.sh"


# --- Step 3: Install AD-Related Packages ---
echo -e "\n[+] Installing Active Directory Tools..."
bash "$SCRIPT_DIR/installation_scripts/AD_tools.sh"


# --- Step 4: Download Wordlists ---
echo -e "\n[+] Downloading Wordlists..."
bash "$SCRIPT_DIR/installation_scripts/wordlists.sh"


# --- TODO: Install MiscTools ---


# --- Step 5: Source custom scripts in .zshrc ---
echo -e "\n[+] Sourcing custom_scripts.sh in ~/.zshrc..."
echo "[ -f \"$SCRIPT_DIR/custom_scripts.sh\" ] && source \"$SCRIPT_DIR/custom_scripts.sh\"" >> ~/.zshrc

# --- Step 6: Run post-install config ---
echo -e "\n[+] Running post-install configuration script..."
bash "$SCRIPT_DIR/post_install_config.sh"



# --- Final Notices ---
echo -e "\n[!] Check Manual Downloads"
echo -e "\n[✔] Strikodot-Kali-edition setup complete. Enjoy your shell."
