#!/bin/bash

# ssh $1 bash -c "mkdir -p ~/.config/nvim/"
scp -r $1:~/.config/nvim/* ~/.config/nvim/
