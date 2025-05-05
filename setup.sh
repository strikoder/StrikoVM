#!/bin/bash

# -------------------------------------------
# Strikodot-Kali-edition Bootstrap Installer
# -------------------------------------------

set -e

# --- Step -1: Make setup location-aware ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# --- Step 0: Install Essential Packages ---
echo -e "\n[+] Installing required packages..."
sudo apt update && sudo apt install -y git tmux feroxbuster dirbuster seclists

# --- Step 1: Create Workspace Directory ---
echo -e "\n[+] Creating ~/strikodot directory..."
mkdir -p ~/strikodot
cd ~/strikodot

# --- Step 2: Git Installations ---
echo -e "[+] Fetching latest linPEAS.sh..."
curl -Lo linpeas.sh https://github.com/peass-ng/PEASS-ng/releases/latest/download/linpeas.sh
chmod +x linpeas.sh

# --- Step 3: Setup .zshrc Block ---
echo -e "\n[+] Appending tmux auto-launch and addhost function to ~/.zshrc..."
cat << 'EOF' >> ~/.zshrc

# Auto-start tmux with vertical split on login
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux has-session -t main 2>/dev/null || {
        tmux new-session -d -s main
        tmux split-window -h -t main
    }
    tmux attach-session -t main
fi

# Add or update a host entry in /etc/hosts
addhost() {
  if [ $# -ne 2 ]; then
    echo "Usage: addhost <IP> <hostname>"
    return 1
  fi
  sudo sed -i "/[[:space:]]$2$/d" /etc/hosts
  echo "$1 $2" | sudo tee -a /etc/hosts > /dev/null
  echo "Added/Updated: $1 $2"
}
EOF

# --- Step 4: Create ~/.tmux.conf ---
echo -e "\n[+] Writing tmux configuration to ~/.tmux.conf..."
cat << 'EOF' > ~/.tmux.conf
# Prefix Key
unbind C-b
set -g prefix C-s
bind C-s send-prefix

# Mouse and Clipboard
set -g mouse on
set -g set-clipboard on

# Vim-style Pane Navigation
setw -g mode-keys vi
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# Resize Panes with Shift+H/J/K/L
bind -r H resize-pane -L 2
bind -r J resize-pane -D 2
bind -r K resize-pane -U 2
bind -r L resize-pane -R 2

# Function Key Window Shortcuts
bind-key -n F1 select-window -t :1
bind-key -n F2 select-window -t :2
bind-key -n F3 select-window -t :3
bind-key -n F4 select-window -t :4
bind-key -n F5 select-window -t :0

# Smart Pane Splits in Current Directory
bind '"' split-window -v -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"

# Status Bar
set -g status-right "Strikoder"

# Reload Config
unbind r
bind r source-file ~/.tmux.conf
EOF

# --- Step 5: Vim clipboard fixing ---

echo -e "\n[+] Enabling system clipboard for Vim..."
echo "set clipboard=unnamedplus" | sudo tee -a /etc/vim/vimrc > /dev/null

# --- Step 6: Copy Custom Tools ---
echo -e "\n[+] Installing full_nmap and cme-brute-multiusers to /usr/local/bin..."
sudo install -m 755 "$SCRIPT_DIR/full_nmap.sh" /usr/local/bin/full_nmap
sudo install -m 755 "$SCRIPT_DIR/cme-brute-multiusers.sh" /usr/local/bin/cme-brute-multiusers

# --- Step 7: Create my_commands helper ---
echo -e "\n[+] Installing 'my_commands' helper to /usr/local/bin..."
sudo tee /usr/local/bin/my_commands > /dev/null << 'EOF'
#!/bin/bash
echo -e "\nAvailable Custom Commands:\n"
echo -e "🔹 full_nmap <target>\n   → Run full + detailed Nmap scans"
echo -e "🔹 cme-brute-multiusers <target> <userlist> <passlist>\n   → Brute SMB with CME and save valid creds for multiple users"
EOF

# --- Keyboard Shortcut Guidance ---
echo -e "\n[!] Don’t forget to configure keyboard shortcuts under Settings > Keyboard > Shortcuts > Navigation:"
echo -e "    Super+1 = Switch to Workspace 1"
echo -e "    Super+2 = Switch to Workspace 2"
echo -e "    Ctrl+Super+1 = Move window to Workspace 1"
echo -e "    Ctrl+Super+2 = Move window to Workspace 2"

# --- Final Notices ---
echo -e "\n[✓] Run 'my_commands' to see your available custom tools."
echo -e "\n[!] Manual step: Download Ligolo-ng from https://github.com/nicocha30/ligolo-ng/releases"
echo -e "\n[!] Manual step: Download winPEAS from https://github.com/peass-ng/PEASS-ng/releases"
echo -e "\n[✔] Strikodot-Kali-edition setup complete. Enjoy your shell."

