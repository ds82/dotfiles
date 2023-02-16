#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    echo "Use: $0 <ip-or-hostname>"
    exit 1
fi

/opt/homebrew/bin/rsync -avz -s --delete --exclude "plugin/**" --rsync-path=/opt/homebrew/bin/rsync ~/.config/nvim/ $1:.config/nvim/
