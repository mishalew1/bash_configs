#!/bin/bash

# This script uninstalls the config files previously installed
# It first creates backups of the config files

files=(
<<<<<<< HEAD
.bashrc_misha 
.bash_prompt_command 
.vimrc 
.tmux.conf 
=======
.bashrc_misha
.bash_prompt_command
.vimrc
.tmux.conf
>>>>>>> da7526cf136b0bd62f7025c6dce94ac4f0128bd6
.bash_aliases
)

for file in "${files[@]}"; do
    cp -n ~/"$file" ~/"$file".bak
    rm ~/"$file";
done
