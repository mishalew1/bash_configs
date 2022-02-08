# Editor
export EDITOR='vi'

# system shortcuts
alias c="clear"
alias l="ls --color=auto"
alias ll="ls -lFh --color=auto"
alias la="ls -AlFh --color=auto"
alias ldir='ls -dhlA .*/ */'
alias cp="cp -rv"
alias mkdir="mkdir -p -v"
alias grep='grep --color=auto'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias bashrc="$EDITOR ~/.bashrc"
alias bashrc2="$EDITOR ~/.bashrc_extra"
alias bashalias="$EDITOR ~/.bash_aliases"
alias bashreload="source ~/.bashrc"
alias zreload="source ~/.zshrc"
alias vimrc="$EDITOR ~/.vimrc"
alias allusers="getent passwd {1000..60000}"
alias update-grub="grub2-mkconfig -o /boot/grub2/grub.cfg"
alias py='python3'
alias mydf='df -h -x squashfs -x tmpfs -x devtmpfs'

# SSH connections
alias sshlist="sed -rn 's/^\s*Host\s+(.*)\s*/\1/ip' ~/.ssh/config"
alias sshedit="$EDITOR ~/.ssh/config"
alias sshkeys='for key in ~/.ssh/id_*; do ssh-keygen -l -f "${key}"; done | uniq'

# networking
alias ip='ip -c'
alias myip="ip -o -4 a | awk {'printf (\"%-6s \t %s \n\", \$2, \$4)'} | grep -v 127.0.0.1"
alias myroute="ip route | grep default | awk '{ print \$1, \"gateway\", \$3 }'"
alias mymac="ip -o link | grep -v loopback | awk {'printf (\"%-11s \t %s \n\", \$2, \$17)'}"

# show top 10 most used commands
alias hist="history | awk '{cmd[\$2]++} END {for(elem in cmd) {print cmd[elem] \" \" elem}}' | sort -n -r | head -10"

# docker shortcuts
alias dimg="docker images"
alias dll="docker container ls -a"
alias dcp='docker-compose -f ~/docker-services/docker-compose.yml'
 
# Git shortcuts
alias gs="git status" 			# View Git status.
alias ga="git add" 				# Add a file to Git.
alias gaa="git add --all"		# Add all files to Git.
alias gc="git commit" 			# Commit changes to the code.
alias gp="git push" 			# push changes to remote repo
alias gl="git log --oneline" 	# View the Git log.
alias gb="git checkout -b" 		# Create a new Git branch and move to the new branch at the same time. 
alias gd="git diff"  			# View the difference.

# Windows WSL configs
#alias nmap="/mnt/c/Program\ Files\ \(x86\)/Nmap/nmap.exe"

# Launching Windows apps from WSL
#alias charm="/mnt/c/Program\ Files/JetBrains/PyCharm\ Community\ Edition\ 2020.3.3/bin/pycharm64.exe"
