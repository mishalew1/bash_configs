# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi



# History size
HISTSIZE=2000
HISTFILESIZE=2000

# Colors
BLACK="\[\033[1;30m\]"
RED="\[\033[1;31m\]"  
GREEN="\[\033[1;32m\]" 
YELLOW="\[\033[1;33m\]"
BLUE="\[\033[0;34m\]" 
PURPLE="\[\033[1;35m\]"
CYAN="\[\033[0;36m\]"
WHITE="\[\033[1;37m\]"
BROWN="\[\033[0;33m\]"
LIGHT_GRAY="\[\033[0;37m\]"
LIGHT_BLUE="\[\033[1;34m\]"
LIGHT_GREEN="\[\033[1;32m\]"
LIGHT_PURPLE="\[\033[1;35m\]"
LIGHT_CYAN="\[\033[1;36m\]"  
LIGHT_RED="\[\033[1;31m\]"
RESTORE="\[\033[0m\]" 


# Build the prompt
function prompt_command {
		RET=$?
			export PS1=$(~/.bash_prompt_command $RET)
}
PROMPT_DIRTRIM=3
export PROMPT_COMMAND=prompt_command

		

# Find largest files example: Downloads $ find_largest_files
function find_largest_files() {
		    du -h -x -s -- * | sort -r -h | head -20;
}


# Grep (search) through your history for previous run commands:  hg vim
function hg() {
		    history | grep "$1";
}


# Show contents of the directory after changing to it
function cd () {
		    builtin cd "$1"
			    ls -AlF
}


#printf "\n"
#printf "   %s\n" "IP ADDR: $(curl -s ifconfig.me)"
#printf "   %s\n" "USER: $(echo $USER)"
#printf "   %s\n" "DATE: $(date)"
#printf "   %s\n" "UPTIME: $(uptime -p)"
#printf "   %s\n" "HOSTNAME: $(hostname -f)"
##printf "   %s\n" "CPU: $(awk -F: '/model name/{print $2}' | head -1)"
#printf "   %s\n" "KERNEL: $(uname -rms)"
#printf "   %s\n" "PACKAGES: $(dpkg --get-selections | wc -l)"
##printf "   %s\n" "RESOLUTION: $(xrandr | awk '/\*/{printf $1" "}')"
#printf "   %s\n" "MEMORY: $(free -m -h | awk '/Mem/{print $3"/"$2}')"
#printf "\n"



export PATH="/home/foo/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/mnt/c/Program Files/Python38/Scripts/:/mnt/c/Program Files/Python38/:/mnt/c/Windows/system32:/mnt/c/Windows:/mnt/c/Windows/System32/Wbem:/mnt/c/Windows/System32/WindowsPowerShell/v1.0/:/mnt/c/Windows/System32/OpenSSH/:/mnt/c/Program Files/PuTTY/:/mnt/c/Program Files/NVIDIA Corporation/NVIDIA NvDLISR:/mnt/c/Users/misha/Documents/_Scripts:/mnt/c/executables:/mnt/c/Program Files/Calibre2/:/mnt/c/Program Files/Microsoft VS Code/bin:/mnt/c/Program Files (x86)/NVIDIA Corporation/PhysX/Common:/mnt/c/WINDOWS/system32:/mnt/c/WINDOWS:/mnt/c/WINDOWS/System32/Wbem:/mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0/:/mnt/c/WINDOWS/System32/OpenSSH/:/mnt/c/Program Files/Docker/Docker/resources/bin:/mnt/c/ProgramData/DockerDesktop/version-bin:/mnt/c/Users/misha/AppData/Local/Programs/Python/Python38-32/Scripts/:/mnt/c/Users/misha/AppData/Local/Programs/Python/Python38-32/:/mnt/c/Users/misha/AppData/Local/Microsoft/WindowsApps:/mnt/c/Program Files/Oracle/VirtualBox:/mnt/c/Program Files/JetBrains/PyCharm Community Edition 2020.3.3/bin:/mnt/c/Program Files (x86)/Nmap:/snap/bin"
