# 🐉 KaliPen

**Yep, I scripted everything *again*. This time it’s cleaner, faster, and actually reusable. Let’s go! 😎**

A one-command setup that turns a fresh Kali install into a fully-equipped, real-world pentesting environment — automated, modular, and zero bloat.

![Kali](https://img.shields.io/badge/Kali-Linux-blue?logo=linux&logoColor=white)
![Auto-Setup](https://img.shields.io/badge/Automated-Setup-success?style=flat-square&color=brightgreen)
![Maintained by \$tr!k0d3r](https://img.shields.io/badge/Maintained%20by-\$tr!k0d3r-blueviolet?style=flat-square)

---

## One-Line Full Setup

Run this on any fresh Kali box to install tools, configure Zsh/tmux, fetch `enum scripts`, and more:

```bash
git clone https://github.com/strikoder/kalipen.git
cd kalipen
chmod +x setup.sh
./setup.sh
````

---

## ⚙ default config editing

### Zsh Configuration

* Auto-starts `tmux` in split mode
* Adds `addhost` helper for `/etc/hosts`

### Tmux Configuration

* Vim-style pane nav
* Mouse + clipboard support
* Prefix remapped to `Ctrl+S` (bye `Ctrl+B` 👋)

### Vim Fixes

* Enables system clipboard for yank/paste

---

## 🔧 Custom CLI Tools

### `full_nmap`

```bash
full_nmap <target>
```

* Full TCP scan
* Extracts open ports
* Runs `-sC -sV` scan on live ports

---

### `my_commands`

```bash
my_commands
```

Lists available custom commands — like a built-in cheat sheet.

---

## Tools You Get

### Enumeration

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

### Network & Web

* [feroxbuster](https://github.com/epi052/feroxbuster) 
* [ffuf](https://github.com/ffuf/ffuf) ❌ optional
* [enum4linux-ng](https://github.com/cddmp/enum4linux-ng) 

---

### Active Directory

* [mitm6](https://github.com/fox-it/mitm6) 
* [kerbrute](https://github.com/ropnop/kerbrute) 

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

##

---

## To Be Added (TODO)

* [bloodhound](https://github.com/BloodHoundAD/BloodHound) + SharpHound
* [AutoRecon](https://github.com/Tib3rius/AutoRecon)
* [nmapAutomator](https://github.com/21y4d/nmapAutomator)
* [assetfinder](https://github.com/tomnomnom/assetfinder)
* [amass](https://github.com/owasp-amass/amass)
* [httprobe](https://github.com/tomnomnom/httprobe)
* [gowitness](https://github.com/sensepost/gowitness)
* [sumrecon](https://github.com/s0md3v/SumRecon)

---

Maintained (and obsessively tweaked) by [@strikoder](https://github.com/strikoder) 💻
