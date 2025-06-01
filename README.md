# 📁 StrikoVM

**Yep, I scripted everything *AGAIN*. This time it’s leaner, meaner, and finally reusable. Let’s go! 😎**

A lightweight and flexible bootstrap for Kali Linux pentesting environments — built for full automation, quick setup, and terminal Zen.

![Kali](https://img.shields.io/badge/Kali-Linux-blue?logo=linux\&logoColor=white)
![Auto-Setup](https://img.shields.io/badge/Automated-Setup-success?style=flat-square\&color=brightgreen)
![Made with ❤️ by \$tr!k0d3r](https://img.shields.io/badge/Maintained%20by-\$tr!k0d3r-blueviolet?style=flat-square)

---

## ⚡ One-Line Full Setup

Run this on any fresh Kali box to install tools, configure Zsh and tmux, fetch `linPEAS`, and get straight to pwning:

```bash
git clone https://github.com/strikoder/StrikoVM.git
cd StrikoVM
chmod +x setup.sh
./setup.sh
```

---


## 📥 Payload Fetching

* Grabs the latest versions of Windows & Linux Enum scripts

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

## 🔧 Custom CLI Tools

As part of the setup, the following scripts are installed to `/usr/local/bin`:

### ✅ `full_nmap`

```bash
full_nmap <target>
```

htb

htba

thm

Automates your Nmap workflow

* Full port scan
* Extracts open ports
* Runs `-sC -sV` against them automatically

### ✅ `my_commands`

```bash
my_commands
```

Shows you the list of installed helper scripts (like a self-updating index)

---

## 🧰 My Pinned Pentest Tools (Auto + Manual)

### 🔎 Enumeration

* [linPEAS](https://github.com/carlospolop/PEASS-ng) — Linux privesc checker ✅ auto-installed
* [linux-exploit-suggester](https://github.com/mzet-/linux-exploit-suggester) — Kernel exploit suggester ✅ auto-installed
* [LinEnum](https://github.com/rebootuser/LinEnum) — Basic enum script ✅ auto-installed
* [linuxprivchecker](https://github.com/sleventyeleven/linuxprivchecker) — Python enum script ✅ auto-installed

🪟 

* [winPEAS](https://github.com/carlospolop/PEASS-ng) — Windows privesc checker ✅ auto (x64 & .bat), PS version optional
* [JAWS](https://github.com/411Hall/JAWS) — PowerShell enum script ✅ auto-installed
* [PrivescCheck](https://github.com/itm4n/PrivescCheck) — PS privesc checks ✅ auto-installed
* [PowerSploit](https://github.com/PowerShellMafia/PowerSploit) — Offensive PS modules ✅ auto-cloned
* [SharpUp](https://github.com/GhostPack/SharpUp) — Local privesc tool ❌ manual build required
* [Seatbelt](https://github.com/GhostPack/Seatbelt) — System enumeration tool ❌ manual build required
* [Evil-WinRM](https://github.com/Hackplayers/evil-winrm) — Best WinRM shell ❌ manual

---
### 🌐 Network & Web Discovery

* [feroxbuster](https://github.com/epi052/feroxbuster) — Fast content discovery ✅ auto
* [dirbuster](https://tools.kali.org/web-applications/dirbuster) — Classic brute-forcer ✅ auto
* [ffuf](https://github.com/ffuf/ffuf) — Fast fuzzer for web dirs ❌ optional
* [enum4linux-ng](https://github.com/cddmp/enum4linux-ng) — Modern SMB enumerator ✅ auto-installed
* [rustscan](https://github.com/RustScan/RustScan) — Super-fast port scanner ✅ auto-installed from GitHub
* [dnsenum](https://github.com/fwaeytens/dnsenum) — DNS recon tool ✅ auto
* [dnsrecon](https://github.com/darkoperator/dnsrecon) — Python DNS recon ✅ auto
* [nikto](https://github.com/sullo/nikto) — Web server scanner ✅ auto
--- 
### ⚙️ Frameworks & Infra

* [Metasploit Framework](https://www.metasploit.com/) — Exploitation suite ✅ pre-installed, just run `msfdb init` for the first time
* [Nessus](https://www.tenable.com/products/nessus) — Full vulnerability scanner ❌ manual download
---

Maintained (and obsessively tweaked) by [@strikoder](https://github.com/strikoder) 💻

---


TODO:
bloodhound + AD stuff
Autorecon / nmapAutomater.sh
asesstfinder
amass
httprobe
gowitness (might needs go -get gorm.io/gorm)
sumrecon
[Ligolo-ng](https://github.com/nicocha30/ligolo-ng)
* [pSpy](https://github.com/DominicBreuker/pspy) — Process monitor without root ❌ manual

