#!/bin/bash

# --- Function: my_commands ---
my_commands() {
  echo "Available custom commands:"
  echo "- my_commands"
  echo "- addhost <IP> <hostname>"
  echo "- stable"
}

# --- Function: addhost ---
addhost() {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: addhost <IP> <hostname>"
    echo "Adds or updates an entry in /etc/hosts"
    return 0
  fi

  if [ $# -ne 2 ]; then
    echo "Usage: addhost <IP> <hostname>"
    return 1
  fi

  sudo sed -i "/[[:space:]]$2$/d" /etc/hosts
  echo "$1 $2" | sudo tee -a /etc/hosts > /dev/null
  echo "Added/Updated: $1 $2"
}

# --- Function: stable ---
stable() {
cat << EOF
python3 -c 'import pty; pty.spawn("/bin/bash")'
Ctrl+Z
stty raw -echo; fg; 
reset
export TERM=xterm
export SHELL=/bin/bash
alias ls='ls -lah --color=auto'
EOF
}
