# History size
HISTSIZE=2000
HISTFILESIZE=2000

# ANSI Colors 
BLACK="\033[0;30m"
RED="\033[0;31m"  
GREEN="\033[0;32m" 
YELLOW="\033[0;33m"
BLUE="\033[0;34m" 
PURPLE="\033[0;35m"
CYAN="\033[0;36m"
WHITE="\033[0;37m"
BROWN="\033[0;33m"
BOLD_GRAY="\033[1;37m"
BOLD_BLUE="\033[1;34m"
BOLD_GREEN="\033[1;32m"
BOLD_PURPLE="\033[1;35m"
BOLD_CYAN="\033[1;36m"  
BOLD_RED="\033[1;31m"
RESTORE="\033[0m" 

# Disable annoying bell
bind 'set bell-style none'

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
			    ls -lF
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
