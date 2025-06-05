#!/bin/bash
set -e

# --- Install base tools ---
sudo apt update && sudo apt install -y git tmux seclists dnsenum dnsrecon nikto enum4linux-ng

# --- Optional tools list ---
declare -A tools=(
  [1]="feroxbuster"
  [2]="dirbuster"
  [3]="ffuf"
  [4]="gobuster"
  [5]="amass"
)

echo -e "\nOptional tools list:"
for i in "${!tools[@]}"; do
  echo "  $i) ${tools[$i]}"
done

read -p $'\nSelect tools to install (e.g. 1,3,5): ' selected

IFS=',' read -ra choices <<< "$selected"
for choice in "${choices[@]}"; do
  tool="${tools[$choice]}"
  if [ -n "$tool" ]; then
    echo "[+] Installing $tool..."
    sudo apt install -y "$tool"
    echo "[✓] $tool installed."
  else
    echo "[!] Invalid choice: $choice"
  fi
done
