#!/bin/bash

# -------------------------------------------
# Strikodot-Kali-edition Bootstrap Installer
# -------------------------------------------

set -e

# --- Step 0: Install Essential Packages ---
echo -e "\n[+] Installing required packages..."
sudo apt update && sudo apt install -y git tmux zsh vim feroxbuster dirbuster seclists

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

# Fast Escape for Terminal Mode
set -sg escape-time 0

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

# --- Vim clipboard fixing ---

echo -e "\n[+] Enabling system clipboard for Vim..."
echo "set clipboard=unnamedplus" | sudo tee -a /etc/vim/vimrc > /dev/null

# --- Keyboard Shortcut Guidance ---
echo -e "\n[!] Don’t forget to configure keyboard shortcuts under Settings > Keyboard > Shortcuts > Navigation:"
echo -e "    Super+1 = Switch to Workspace 1"
echo -e "    Super+2 = Switch to Workspace 2"
echo -e "    Ctrl+Super+1 = Move window to Workspace 1"
echo -e "    Ctrl+Super+2 = Move window to Workspace 2"

# --- Done ---
echo -e "\n[✔] Strikodot-Kali-edition setup complete. Enjoy your shell."
echo -e "\n[!] Manual step: Download Ligolo-ng from https://github.com/nicocha30/ligolo-ng/releases"
echo -e "\n[!] Manual step: Download winPEAS from https://github.com/peass-ng/PEASS-ng/releases"
