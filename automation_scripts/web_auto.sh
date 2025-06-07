#!/bin/bash
set -e

DOMAIN="$1"
if [[ -z "$DOMAIN" ]]; then
  echo "Usage: $0 <target.com>"
  exit 1
fi

echo "[*] Starting subdomain enumeration for $DOMAIN..."

# Output files
OUT_DIR="$DOMAIN-recon"
mkdir -p "$OUT_DIR"
SUBS_RAW="$OUT_DIR/subs_raw.txt"
SUBS_UNIQ="$OUT_DIR/subs_unique.txt"
LIVE_SUBS="$OUT_DIR/live_subs.txt"

# Step 1: Passive enumeration
echo "[*] Running subfinder..."
subfinder -d "$DOMAIN" -silent >> "$SUBS_RAW"

echo "[*] Running amass passive..."
amass enum -passive -d "$DOMAIN" >> "$SUBS_RAW"

echo "[*] Running findomain..."
findomain -t "$DOMAIN" -q >> "$SUBS_RAW"

# Step 2: Deduplicate
echo "[*] Removing duplicates..."
sort -u "$SUBS_RAW" > "$SUBS_UNIQ"

# Step 3: Validate with dnsx
echo "[*] Validating subdomains with dnsx..."
dnsx -silent -l "$SUBS_UNIQ" > "$LIVE_SUBS"

# Optional: Port scan with httpx
echo "[*] Checking live web services with httpx..."
httpx -silent -l "$LIVE_SUBS" -ports 80,443,8000,8080,8443 -title -status-code -tech-detect -o "$OUT_DIR/httpx_results.txt"

# Step 5: Screenshots with gowitness
echo "[*] Taking screenshots with GoWitness..."
gowitness file -f "$OUT_DIR/httpx_urls.txt" --timeout 5 --threads 10 --log-level error --destination "$OUT_DIR/gowitness"


echo "[✓] Recon completed. Results saved in $OUT_DIR/"
echo " [+] Hint: grep for dev, test, stage, admin"
