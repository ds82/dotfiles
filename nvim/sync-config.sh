#!/bin/bash

# ssh $1 bash -c "mkdir -p ~/.config/nvim/"
scp -r ~/.config/nvim/* $1:~/.config/nvim/
