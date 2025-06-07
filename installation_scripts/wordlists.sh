#!/bin/bash
set -e

read -p "Do you want to unzip rockyou.txt and install jsmith list? [Y/N]:" confirm

if [[ "$confirm" =~ ^[Yy]$ ]]; then

    # --- Step 1: Extract rockyou.txt ---
    rockyou="/usr/share/wordlists/rockyou.txt.gz"

    if [ -f "$rockyou" ]; then
        sudo gzip -d "$rockyou"
        echo "[✓] rockyou.txt extracted!"
    else
        echo "[!] rockyou.txt.gz not found at $rockyou"
    fi

    # --- Step 2: Create custom wordlist directory ---
    DEST_DIR="/wordlists/custom/AD/"
    sudo mkdir -p "$DEST_DIR"

    # --- Step 3: Download jsmith list ---
    echo "[+] Downloading jsmith username list..."
    sudo curl -sSL https://raw.githubusercontent.com/insidetrust/statistically-likely-usernames/master/jsmith.txt -o "$DEST_DIR/jsmith.txt"
    echo "[✓] Saved to $DEST_DIR/jsmith.txt"

else
    echo "[-] Skipped datasets install & rockyou unzapping."
fi
