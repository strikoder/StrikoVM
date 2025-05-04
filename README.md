# 📁 Strikodot-Kali-edition

**Well, I decided to script everything *AGAIN* afterall. So here we go :D**

A lightweight and flexible bootstrap for Kali Linux pentesting environments — designed for full automation but easy to understand and extend.

---

## ⚡ One-Line Full Setup

Run this on any fresh Kali box to install tools, configure the shell and tmux, fetch `linPEAS`, and more:

```bash
curl -sSL https://raw.githubusercontent.com/strikoder/Strikodot-Kali-edition/main/setup.sh | bash
```

---

## 🧭 What This Script Does

* Installs: `git`, `tmux`, `zsh`, `vim`, `feroxbuster`, `dirbuster`, `seclists`
* Creates `~/strikodot` working directory
* Downloads: `linPEAS.sh`
* Appends Zsh config for tmux auto-split and `addhost` function
* Generates `~/.tmux.conf` with sane keybindings and layout
* Adds `set clipboard=unnamedplus` to Vim config
* Reminds you to set workspace shortcuts manually

---

## 🧠 Post-Setup Manual Steps

Some things must still be done manually:

### 🔹 Install these tools manually:

* [Ligolo-ng](https://github.com/nicocha30/ligolo-ng/releases)
* [winPEAS](https://github.com/peass-ng/PEASS-ng/releases)

Put them somewhere like `~/tools/` or `~/strikodot/`.

### 🔹 Configure workspace keybindings

Go to:

```
Settings > Keyboard > Shortcuts > Navigation
```

And set:

```
Super+1           = Switch to Workspace 1
Super+2           = Switch to Workspace 2
Ctrl+Super+1      = Move window to Workspace 1
Ctrl+Super+2      = Move window to Workspace 2
```

---

## ✅ After Running the Script

* Shell auto-launches tmux with vertical split
* You can use `addhost 10.10.10.5 t1` to manage `/etc/hosts`
* Vim supports clipboard copy/paste
* Tmux uses `Ctrl+S` as prefix, supports mouse, and has Vim-style navigation

You're now ready to hack.

---

Maintained by [@strikoder](https://github.com/strikoder)
