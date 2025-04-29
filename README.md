## 📁 Strikodot-Kali-edition

A repo to keep a light version of dotfiles for Kali Linux pentesting environments.

---

## 🧭 What to Edit:

---

### ✅ 1. Window Manager: Workspaces

Set keyboard shortcuts in your settings to be similar like others WM:

```
Super+1 = Workspace 1  
Super+2 = Workspace 2  
...etc.
```

Configure this from your **Settings > Keyboard > Shortcuts > Window Manager**.

---

### ✅ 2. `~/.zshrc` — Shell Config

#### 🔹 Command to edit:
```bash
nano ~/.zshrc
```

#### 🔹 Paste the following block:

```sh
# Auto-start tmux if not already running
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach-session -t main || tmux new-session -s main
fi

# Alias to add IP as 'target1' to /etc/hosts
alias add='f(){ echo "$1 target1" | sudo tee -a /etc/hosts; }; f'
```

#### 🧪 Example usage:
```bash
add 10.10.11.123
# This adds: 10.10.11.123 target1 to /etc/hosts
```

---

### ✅ 3. `~/.tmux.conf` — Tmux Config

#### 🔹 Command to edit:
```bash
nano ~/.tmux.conf
```

#### 🔹 Paste the following config:

```tmux
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
```

---

### ✅ 4. Vim Clipboard Support

#### 🔹 Command to edit:
```bash
sudo nano /etc/vim/vimrc
```

#### 🔹 Add this at the bottom:
```vim
set clipboard=unnamedplus
```

This enables copying/pasting between system clipboard and Vim.

---
