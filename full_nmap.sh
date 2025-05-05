#!/bin/bash

# ----------------------------------------------------
# full_nmap — Automated Full & Targeted Nmap Scanning
# ----------------------------------------------------
# This script streamlines common Nmap workflows:
# 1. Runs a full TCP port scan against the target.
# 2. Extracts the open ports.
# 3. Performs a detailed scan (-sC -sV) on only the open ports.
#
# Usage:
#   full_nmap <target_ip_or_hostname>

if [ -z "$1" ]; then
  echo "Usage: full_nmap <target_ip_or_hostname>"
  exit 1
fi

target="$1"

echo "[*] Running full TCP port scan on $target..."
nmap -p- -sS -T4 -Pn -n -oA full_scan_output "$target"

ports=$(grep ^[0-9] full_scan_output.nmap | cut -d '/' -f1 | paste -sd, -)
echo "[*] Open ports: $ports"

echo "[*] Running detailed service scan..."
nmap -sC -sV -p "$ports" -T4 -oA detailed_scan_output "$target"
