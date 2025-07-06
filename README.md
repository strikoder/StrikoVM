# 🐉 KaliPen

**Yep, I scripted everything *again*. This time it’s cleaner, faster, and actually reusable. Let’s go! 😎**

A one-command setup that turns a fresh Kali install into a fully-equipped, real-world pentesting environment — automated, modular, and zero bloat.

![Kali](https://img.shields.io/badge/Kali-Linux-blue?logo=linux&logoColor=white)
![Auto-Setup](https://img.shields.io/badge/Automated-Setup-success?style=flat-square&color=brightgreen)
![Maintained by \$tr!k0d3r](https://img.shields.io/badge/Maintained%20by-\$tr!k0d3r-blueviolet?style=flat-square)

---

## One-Line Full Setup

Run this on any fresh Kali box to install tools, configure Zsh/tmux/vim, fetch enumeration scripts, and load custom shell functions:

```bash
git clone https://github.com/strikoder/kalipen.git
cd kalipen
chmod +x setup.sh
./setup.sh
```

---

## ⚙ Configuration Overview

### 🔹 Zsh Setup
- Auto-launches `tmux` on terminal open  
- Loads custom functions from `custom_scripts.sh`  
- Adds helpers like `addhost`, `stable`, `my_commands`

### 🔹 Tmux Config
- Prefix remapped to `Ctrl+S`  
- Mouse + clipboard enabled  
- F1–F5 window shortcuts  

### 🔹 Vim Fix
- Enables system clipboard (`unnamedplus`) for yank/paste  

---

## 🛠️ Custom CLI Functions

These are sourced into every new shell via `custom_scripts.sh`.

### `my_commands`
```bash
my_commands
```
Lists all available custom helper functions.

### `addhost`
```bash
addhost 10.10.14.25 target.local
```
Adds or updates an entry in `/etc/hosts`.

### `stable`
```bash
stable
```
Prints a full stable shell upgrade procedure with useful aliases.


## Tools You Get

### Enumeration Scripts

🐧 **Linux**

* [linPEAS](https://github.com/carlospolop/PEASS-ng)
* [linux-exploit-suggester](https://github.com/mzet-/linux-exploit-suggester) 
* [LinEnum](https://github.com/rebootuser/LinEnum) 
* [linuxprivchecker](https://github.com/sleventyeleven/linuxprivchecker) 

🪟 **Windows**

* [winPEAS](https://github.com/carlospolop/PEASS-ng) (`.exe` & `.bat`)
* [JAWS](https://github.com/411Hall/JAWS) 
* [PrivescCheck](https://github.com/itm4n/PrivescCheck) 
* [PowerSploit](https://github.com/PowerShellMafia/PowerSploit) 
* [SharpUp](https://github.com/GhostPack/SharpUp) ❌ manual build
* [Seatbelt](https://github.com/GhostPack/Seatbelt) ❌ manual build
* [Evil-WinRM](https://github.com/Hackplayers/evil-winrm) ❌ manual

---

### basic_pkgs
tmux, git, unzip, make, golang, wget, python3-pip

enum4linux-ng, dnsenum, dnsrecon, nikto, seclists

Choose interactively:

ffuf

feroxbuster

gobuster

dirbuster

---

### WEB
subfinder

amass (passive)

findomain

dnsx

httpx

aquatone
---

### Active Directory

kerbrute — from source + compiled

mitm6 — via apt

PlumHound — automated install + wrapper

SharpHound Collectors — .exe and .ps1 downloaded & ready

### Wordlists
* `rockyou.txt` You have the choice to extract it or not
* [`jsmith.txt`](https://github.com/insidetrust/statistically-likely-usernames/blob/master/jsmith.txt) `/wordlists/custom/AD/jsmith/`

---

## 🔧 Manual Download

* [Nessus](https://www.tenable.com/products/nessus) ❌ manual download
* [Ligolo-ng](https://github.com/nicocha30/ligolo-ng) ❌ manual
* [pSpy](https://github.com/DominicBreuker/pspy) ❌ manual
* [Evil-WinRM](https://github.com/Hackplayers/evil-winrm) ❌ manual
---
## May be Needed 
* [windapsearch](https://github.com/ropnop/windapsearch)

---

## To Be Added (TODO)

* SharpHound
* [AutoRecon](https://github.com/Tib3rius/AutoRecon)
* [nmapAutomator](https://github.com/21y4d/nmapAutomator)
* [assetfinder](https://github.com/tomnomnom/assetfinder)
* [httprobe](https://github.com/tomnomnom/httprobe)
* [gowitness](https://github.com/sensepost/gowitness)
* [sumrecon](https://github.com/s0md3v/SumRecon)

---

Maintained (and obsessively tweaked) by [@strikoder](https://www.youtube.com/@strikoder) 💻
