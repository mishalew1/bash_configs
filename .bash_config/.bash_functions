# find largest files example: Downloads $ find_largest_files
function find_largest_files() {
    du -h -x -s -- * | sort -r -h | head -20;
}


# grep (search) through your history for previous run commands:  hg vim
function hg() {
    history | grep "$1";
}


# show contents of the directory after changing to it
function cd() {
	if [ $# = 0 ]; then
		builtin cd $HOME
		pwd
    else
		builtin cd "$1"
    	ls -lFh
	fi
}

# make dir and cd into the dir
function mkcd() {
    mkdir "$1"; cd "$1";
}


function backup_file() {
	cp -i "$1"{,.bak};
}


# compare md5sums like so: md5check [file] [key]
function md5check() {
    md5sum "$1" | grep "$2"
}


# extract any file based on file extension matching
extract() { 
    if [ -f $1 ] ; then 
      case $1 in 
        *.tar.bz2)   tar xjf $1     ;; 
        *.tar.gz)    tar xzf $1     ;; 
        *.bz2)       bunzip2 $1     ;; 
        *.rar)       unrar e $1     ;; 
        *.gz)        gunzip $1      ;; 
        *.tar)       tar xf $1      ;; 
        *.tbz2)      tar xjf $1     ;; 
        *.tgz)       tar xzf $1     ;; 
        *.zip)       unzip $1       ;; 
        *.Z)         uncompress $1  ;; 
        *.7z)        7z x $1        ;; 
        *)     echo "'$1' cannot be extracted via extract()" ;; 
         esac 
     else 
         echo "'$1' is not a valid file" 
     fi 
}
