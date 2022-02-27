#!/bin/bash

# This script uninstalls the config files previously installed
# It first creates backups of the config files

FILES=(
.bash_aliases
.bash_prompt_command 
.bashrc_extra 
.tmux.conf 
.vimrc 
)

for file in "${FILES[@]}"; do
    cp -n ~/"$file" ~/"$file".bak
    rm ~/"$file";
done

# Reset PROMPT_COMMAND variable
unset PROMPT_COMMAND

# Reload bashrc
source ~/.bashrc
