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

# --- Step 5: Setup .zshrc Block ---
echo -e "\n[+] Appending tmux auto-launch and addhost function to ~/.zshrc..."
cat << 'EOF' >> ~/.zshrc

# Auto-start tmux with vertical split on login
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux has-session -t main 2>/dev/null || {
        tmux new-session -d -s main
    }
    tmux attach-session -t main
fi

# --- Step 6: Create ~/.tmux.conf ---
echo -e "\n[+] Writing tmux configuration to ~/.tmux.conf..."
cat << 'EOF' > ~/.tmux.conf
# Prefix Key
unbind C-b
set -g prefix C-s
bind C-s send-prefix

# Mouse and Clipboard
set -g mouse on
set -g set-clipboard on

# Function Key Window Shortcuts
bind-key -n F1 select-window -t :1
bind-key -n F2 select-window -t :2
bind-key -n F3 select-window -t :3
bind-key -n F4 select-window -t :4
bind-key -n F5 select-window -t :0

# Status Bar
set -g status-right "Strikoder"
EOF

# --- Step 7: Vim clipboard fixing ---
echo -e "\n[+] Enabling system clipboard for Vim..."
echo "set clipboard=unnamedplus" | sudo tee -a /etc/vim/vimrc > /dev/null

# --- Step 8: Keyboard Shortcut Guidance ---
echo -e "\n[!] Don’t forget to configure keyboard shortcuts under:"
echo -e "    Settings > Keyboard > Shortcuts > Navigation"
echo -e "    Super+1 = Switch to Workspace 1"
echo -e "    Super+2 = Switch to Workspace 2"
echo -e "    Ctrl+Super+1 = Move window to Workspace 1"
echo -e "    Ctrl+Super+2 = Move window to Workspace 2"

# --- Step X: Source custom scripts in .zshrc ---
echo -e "\n[+] Sourcing custom_scripts.sh in ~/.zshrc..."
echo "[ -f \"$SCRIPT_DIR/custom_scripts.sh\" ] && source \"$SCRIPT_DIR/custom_scripts.sh\"" >> ~/.zshrc



# --- Final Notices ---
echo -e "\n[!] Check Manual Downloads"
echo -e "\n[✔] Strikodot-Kali-edition setup complete. Enjoy your shell."
