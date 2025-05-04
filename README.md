# 📁 Strikodot-Kali-edition

**Yep, I scripted everything *AGAIN*. This time it’s leaner, meaner, and finally reusable. Let’s go! 😎**

A lightweight and flexible bootstrap for Kali Linux pentesting environments — built for full automation, quick setup, and terminal Zen.

---

![Kali](https://img.shields.io/badge/Kali-Linux-blue?logo=linux\&logoColor=white)
![Auto-Setup](https://img.shields.io/badge/Automated-Setup-success?style=flat-square\&color=brightgreen)
![Made with ❤️ by $tr!k0d3r](https://img.shields.io/badge/Maintained%20by-$tr!k0d3r-blueviolet?style=flat-square)

---

## ⚡ One-Line Full Setup

Run this on any fresh Kali box to install tools, configure Zsh and tmux, fetch `linPEAS`, and get straight to pwning:

```bash
curl -sSL https://raw.githubusercontent.com/strikoder/Strikodot-Kali-edition/main/setup.sh | bash
```

---

## 🔧 Core Installs

* `git`, `tmux`, `zsh`, `vim`, `feroxbuster`, `dirbuster`, `seclists`

## 📁 File Structure

* Creates `~/strikodot` for tool storage

## 📥 Payload Fetching

* Grabs the latest `linPEAS.sh` for Linux privilege escalation

## ⚙️ Zsh Setup

* Auto-starts tmux on terminal open (with a vertical split by default)
* Adds a clean `addhost` function to manage `/etc/hosts`

## 🪟 Tmux Configuration

* Loads sane keybindings into `~/.tmux.conf`
* Vim-style pane navigation, smart directory splitting
* Enables mouse & clipboard support
* Prefix changed from `Ctrl+B` to the less annoying `Ctrl+S`

## 📝 Vim Clipboard

* Enables system clipboard support for copy/paste magic

---

## 📦 Manual Downloads

Download and extract the following:

* [Ligolo-ng](https://github.com/nicocha30/ligolo-ng/releases) — tunnel everything
* [winPEAS](https://github.com/peass-ng/PEASS-ng/releases) — escalate on Windows like a boss

👉 Place them in `~/strikodot/` for consistency.

## 🧠 Configure Workspace Navigation Shortcuts

Go to:

```
Settings > Keyboard > Shortcuts > Navigation
```

And set these like a proper tiling WM user:

```
Super+1           → Switch to Workspace 1  
Super+2           → Switch to Workspace 2  
Ctrl+Super+1      → Move window to Workspace 1  
Ctrl+Super+2      → Move window to Workspace 2  
```

---

## 🧰 My Pinned Pentest Tools (Auto + Manual)

* [linPEAS](https://github.com/carlospolop/PEASS-ng) — Linux privesc checker ✅ auto-installed
* [winPEAS](https://github.com/carlospolop/PEASS-ng) — Windows privesc checker ❌ manual
* [Ligolo-ng](https://github.com/nicocha30/ligolo-ng) — Reverse SOCKS tunneler ❌ manual
* [feroxbuster](https://github.com/epi052/feroxbuster) — Fast content discovery ✅ auto
* [dirbuster](https://tools.kali.org/web-applications/dirbuster) — Classic brute-forcer ✅ auto
* [ffuf](https://github.com/ffuf/ffuf) — Fast fuzzer for web dirs ❌ (install if needed)
* [Evil-WinRM](https://github.com/Hackplayers/evil-winrm) — Best WinRM shell ❌
* [pSpy](https://github.com/DominicBreuker/pspy) — Process monitor without root ❌

---

Maintained (and obsessively tweaked) by [@strikoder](https://github.com/strikoder) 💻

---
