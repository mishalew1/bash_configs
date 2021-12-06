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


# Copy .bashrc_misha to ~
if [ -f ~/.bash_aliases ]; then
    echo -e "${RED}NOT overriding exisiting .bash_aliases"
else
    cp -n .bash_aliases ~
    echo -e "${GREEN}SUCCESS, copied .bash_aliases"
fi


# Copy .bash_aliases to ~
if [ -f ~/.bash_aliases ]; then
    echo -e "${RED}NOT overriding exisiting .bash_aliases"
else
    cp -n .bash_aliases ~
    echo -e "${GREEN}SUCCESS, copied .bash_aliases"
fi


# Copy bash_prompt_command to ~
if [ -f ~/.bash_prompt_command ]; then
    echo -e "${RED}NOT overriding exisiting .bash_prompt_command"
else
    cp -n .bash_prompt_command  ~
    echo -e "${GREEN}SUCCESS, copied .bash_prompt_command"
fi


# Copy .vimrc to ~
if [ -f ~/.vimrc ]; then
    echo -e "${RED}NOT overriding exisiting .vimrc"
else
    cp -n .vimrc  ~
    echo -e "${GREEN}SUCCESS, copied .vimrc"
fi


# Copy .tmux to ~
if [ -f ~/.tmux.conf ]; then
    echo -e "${RED}NOT overriding exisiting .tmux.conf"
else
    cp -n .tmux.conf  ~
    echo -e "${GREEN}SUCCESS, copied .tmux.conf"
fi


# Add source bash_aliases in ~/.bashrc
if grep -q "if \[ -f ~/.bash_aliases ]" ~/.bashrc; then
        echo -e "${RED}.bash_alias reference already configured${RESTORE}"
else
        echo -e "${GREEN}adding reference to bash_aliases file in bashrc${RESTORE}"
    cat >> ~/.bashrc << EOF
if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
fi

EOF
fi


# Add source bashrc_misha in ~/.bashrc
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


# Reload current environment
source ~/.bashrc
