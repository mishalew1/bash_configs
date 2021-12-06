#!/bin/bash

# This script uninstalls the config files previously installed
# It first creates backups of the config files

files=(
.bashrc_misha
.bash_prompt_command
.vimrc
.tmux.conf
.bash_aliases
)

for file in "${files[@]}"; do
    cp -n ~/"$file" ~/"$file".bak
    rm ~/"$file";
done
