#!/bin/bash

# This script will install my bash configurations
# It will check for pre-existing configs and not override them


# Colors
BLACK="\[\033[0;30m"
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
PURPLE="\033[0;35m"
CYAN="\033[0;36m"
WHITE="\033[0;37m"
BROWN="\033[0;33m"
LIGHT_GRAY="\033[0;37m"
LIGHT_BLUE="\033[0;34m"
LIGHT_GREEN="\033[0;32m"
LIGHT_PURPLE="\033[0;35m"
LIGHT_CYAN="\033[0;36m"
LIGHT_RED="\033[0;31m"
RESTORE="\033[0m"


# Bash aliases copy
if [ -f ~/.bash_aliases ]; then
    echo -e "${RED}NOT overriding exisiting .bash_aliases"
else
    cp -nv .bash_aliases ~/.bash_aliases
    echo -e "${GREEN}SUCCESS, copied .bash_aliases"
fi


# TMUX Conf setup
if [ -f ~/.tmux.conf ]; then
    echo -e "${RED}NOT overriding exisiting .tmux.conf"
else
    cp -nv .tmux.conf ~/.tmux.conf
    echo -e "${GREEN}SUCCESS, copied .tmux.conf"
fi


# Add source bash_aliases on .bashrc
if grep -q "if \[ -f ~/.bashrc_misha ]" ~/.bashrc; then
        echo -e "${RED}.bashrc_misha reference already configured"
else
        echo -e "${GREEN}.bashrc_misha reference added to .bashrc"
    cat >> ~/.bashrc << EOF
if [ -f ~/.bashrc_misha ]; then
        . ~/.bashrc_misha
fi
EOF
fi


# Add source bash_aliases on .bashrc
if grep -q "if \[ -f ~/.bash_aliases ]" ~/.bashrc; then
        echo -e "${RED}bash_alias reference already configured${RESTORE}"
else
        echo -e "${GREEN}adding reference to bash_aliases file in bashrc${RESTORE}"
    cat >> ~/.bashrc << EOF
if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
fi
EOF
fi

# Reload current environment
source ~/.bashrc
