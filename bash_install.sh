#!/bin/bash

# This script will install my bash configurations
# It will check for pre-existing configs and not override them


# Colors
RED="\033[0;31m"
GREEN="\033[0;32m"
RESTORE="\033[0m"
BASHDIR="$HOME/.bash_config"

# list of items to be copied to $HOME
COPY_THESE=(
.bash_config/
.ansiweatherrc
.tmux.conf
.vimrc
.Xresources
)

# loop through list and copy items to $HOME
for item in ${COPY_THESE[@]}; do
	cp -nr "$item" "$HOME"

done


# Add source bashrc_extra in ~/.bashrc
if grep -q ".bash_config/.bash_source ]" ~/.bashrc; then
    echo -e "${RED}.bash_config/.bash_source reference already configured${RESTORE}"
else
    echo -e "${GREEN}.bash_config/.bash_source reference added to .bashrc${RESTORE}"
    cat >> ~/.bashrc << 'EOF'

if [ -f $HOME/.bash_config/.bash_source ]; then
    . $HOME/.bash_config/.bash_source
fi
EOF
fi

# If root change user to red and prompt to #
#if 
	#sed -n -r '/echo "\$\{\w+\}\\u \$\{\w+\}\\h(.*)/p' .bash_prompt_command






# Reload current environment
source ~/.bashrc
