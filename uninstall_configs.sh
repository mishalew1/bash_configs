#!/bin/bash

# This script uninstalls the config files previously installed
# It first creates backups of the config files

files=(
.bash_aliases
.bash_prompt_command 
.bashrc_extra 
.tmux.conf 
.vimrc 
)

for file in "${files[@]}"; do
    cp -n ~/"$file" ~/"$file".bak
    rm ~/"$file";
done
