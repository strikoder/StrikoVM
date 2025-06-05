#!/bin/bash
set -e

# --- Install base tools ---
sudo apt update && sudo apt install -y git tmux gobuster seclists dnsenum dnsrecon nikto enum4linux-ng

# --- Prompt for feroxbuster ---
read -p "Do you want to install feroxbuster? [Y/N]: " install_ferox
if [[ "$install_ferox" =~ ^[Yy]$ ]]; then
    sudo apt install -y feroxbuster
    echo "[✓] feroxbuster installed."
else
    echo "[!] Skipped feroxbuster."
fi

# --- Prompt for dirbuster ---
read -p "Do you want to install OWASP DirBuster? [Y/N]: " install_dirbuster
if [[ "$install_dirbuster" =~ ^[Yy]$ ]]; then
    sudo apt install -y dirbuster
    echo "[✓] dirbuster installed."
else
    echo "[!] Skipped dirbuster."
fi
