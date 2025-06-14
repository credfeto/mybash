#!/bin/bash
iatest=$(expr index "$-" i)

[ -f /etc/os-release ] && source /etc/os-release
export LINUX_DISTRIBUTION=$ID

#echo "HOME: $HOME"

# The $XDG_DATA_HOME environment variable is not set, make sure to add it to your shell's configuration before setting any of the other environment variables!
export XDG_DATA_HOME=$HOME/.local/share
#echo "XDG_DATA_HOME: $XDG_DATA_HOME"
[ ! -d "$XDG_DATA_HOME" ] && mkdir $XDG_DATA_HOME > /dev/null 2>&1

# The $XDG_CONFIG_HOME environment variable is not set, make sure to add it to your shell's configuration before setting any of the other environment variables!
export XDG_CONFIG_HOME=$HOME/.config
#echo "XDG_CONFIG_HOME: $XDG_CONFIG_HOME"
[ ! -d "$XDG_CONFIG_HOME" ] && mkdir $XDG_CONFIG_HOME > /dev/null 2>&1

# The $XDG_STATE_HOME environment variable is not set, make sure to add it to your shell's configuration before setting any of the other environment variables!
export XDG_STATE_HOME=$HOME/.local/state
#echo "XDG_STATE_HOME: $XDG_STATE_HOME"
[ ! -d "$XDG_STATE_HOME" ] && mkdir $XDG_STATE_HOME > /dev/null 2>&1

# The $XDG_CACHE_HOME environment variable is not set, make sure to add it to your shell's configuration before setting any of the other environment variables!
export XDG_CACHE_HOME=$HOME/.cache
#echo "XDG_CACHE_HOME: $XDG_CACHE_HOME"
[ ! -d "$XDG_CACHE_HOME" ] && mkdir $XDG_CACHE_HOME > /dev/null 2>&1


#######################################################
# XDG
#######################################################

## AWS
[ ! -d "$XDG_CONFIG_HOME/aws" ] && mkdir "$XDG_CONFIG_HOME/aws" > /dev/null 2>&1
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"

# Bash History
[ ! -d "$XDG_STATE_HOME/bash" ] && mkdir "$XDG_STATE_HOME/bash" > /dev/null 2>&1
export HISTFILE="${XDG_STATE_HOME}/bash/history"


# Cargo
[ ! -d "$XDG_DATA_HOME/cargo" ] && mkdir "$XDG_DATA_HOME/cargo" > /dev/null 2>&1
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# Docker
[ ! -d "$XDG_CONFIG_HOME/docker" ] && mkdir "$XDG_CONFIG_HOME/docker" > /dev/null 2>&1
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# GnuPG
[ ! -d "$XDG_DATA_HOME/gnupg" ] && mkdir "$XDG_DATA_HOME/gnupg" > /dev/null 2>&1
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

# GO
[ ! -d "$XDG_DATA_HOME/go" ] && mkdir "$XDG_DATA_HOME/go" > /dev/null 2>&1
export GOPATH="$XDG_DATA_HOME/go"

# GTK
[ ! -d "$XDG_CONFIG_HOME/gtk-2.0" ] && mkdir "$XDG_CONFIG_HOME/gtk2.0" > /dev/null 2>&1
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

# IPFS
[ ! -d "$XDG_DATA_HOME/ipfs" ] && mkdir "$XDG_DATAHOME/ipfs" > /dev/null 2>&1
export IPFS_PATH="$XDG_DATA_HOME/ipfs"

# KDE
[ ! -d "$XDG_CONFIG_HOME/kde" ] && mkdir "$XDG_CONFIG_HOME/kde" > /dev/null 2>&1
export KDEHOME="$XDG_CONFIG_HOME/kde"

# Less
[ ! -d "$XDG_CACHE_HOME/less" ] && mkdir "$XDG_CACHE_HOME/less" > /dev/null 2>&1
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"

# NPM
[ ! -d "$XDG_CONFIG_HOME/npm" ] && mkdir "$XDG_CONFIG_HOME/npm" > /dev/null 2>&1
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

# NUGET
[ ! -d "$XDG_CACHE_HOME/NuGetPackages" ] && mkdir "$XDG_CACHE_HOME/NugetPackages" > /dev/null 2>&1
export NUGET_PACKAGES="$XDG_CACHE_HOME/NuGetPackages"

# NV
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
# NVM
export NVM_DIR="$XDG_DATA_HOME/nvm"

# XAuthority
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"

export PSQL_HISTORY="$XDG_DATA_HOME/psql_history"


#######################################################
# SSH/SSH AGENT
#######################################################

# IF ssh-agent is being used
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

# If gpg-agent is being used
#export SSH_AGENT_PID=""
#export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"



#######################################################
# Android/ADB
#######################################################
export ANDROID_USER_HOME="$XDG_DATA_HOME"/android
alias adb='HOME="$XDG_DATA_HOME"/android adb'

#######################################################
# Ansible
#######################################################

export ANSIBLE_HOME="$XDG_DATA_HOME"/ansible


#######################################################
# WGET
#######################################################

alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

#######################################################
#######################################################
#######################################################

# SCRIPT Paths
#######################################################

[ -d "$HOME/work/personal/scripts/db" ] && PATH="$PATH:$HOME/work/personal/scripts/db"
[ -d "$HOME/work/personal/scripts/general" ] && PATH="$PATH:$HOME/work/personal/scripts/general"
[ -d "$HOME/work/personal/scripts/git" ] && PATH="$PATH:$HOME/work/personal/scripts/git"

# DOTNET
[ -d "/zram/$LOGNAME/dotnet" ] && DOTNET_ROOT=/zram/$LOGNAME/dotnet
[ -d "/usr/src/dotnet" ] && [ -z "$DOTNET_ROOT" ] && DOTNET_ROOT=/usr/src/dotnet
[ -d "/usr/share/dotnet" ] && [ -z "$DOTNET_ROOT" ] && DOTNET_ROOT=/usr/share/dotnet
#[ -z "$DOTNET_ROOT" ] && DOTNET_ROOT=$DOTNET_ROOT/tools
[ -d "/usr/share/dotnet" ] && PATH="$PATH:$DOTNET_ROOT"


# Dotnet settings
export DOTNET_NOLOGO=true
export DOTNET_PRINT_TELEMETRY_MESSAGE=false
export DOTNET_JitCollect64BitCounts=1
export DOTNET_ReadyToRun=0
export DOTNET_TC_QuickJitForLoops=1
export DOTNET_TC_CallCountingDelayMs=0
export DOTNET_TieredPGO=1
export MSBUILDTERMINALLOGGER=auto
export SuppressNETCoreSdkPreviewMessage=true


# NVM
[ -f "/usr/share/nvm/init-nvm.sh" ] && \. /usr/share/nvm/init-nvm.sh
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#alias npm="npm"
#alias npx="npx"
#alias npm="npm"
export NODE_OPTIONS="--max-old-space-size=16384"

# SAM
export SAM_CLI_BETA_ESBUILD=1

# load in work specific secrets
[ -f "$HOME/work/funfair/secrets.bashrc" ] && \. "$HOME/work/funfair/secrets.bashrc" 

[ -f "$HOME/.local/share/JetBrains/Toolbox/scripts" ] && PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"

# docker
alias docker="sudo docker"

#######################################################
# PACMAN ALIASES
#######################################################

if [ "$LINUX_DISTRIBUTION" = "arch" ] ; then

alias pacman='sudo pacman'
alias pacman-reinstall="pacman -Qqn | sudo pacman -S -"
alias pacman-rebuild-aur="yay -Sy --rebuildtree --rebuildall $(pacman -Qqme)"
alias pacman-remove-unused="pacman -Qdtq | sudo pacman -Rs -"

fi

#######################################################
# SHUTDOWN/RESTART
#######################################################
alias shutdown="sudo shutdown"
alias reboot="sudo reboot"

#######################################################
# SOURCED ALIAS'S AND SCRIPTS BY zachbrowne.me
#######################################################

# Source global definitions
if [ -f /etc/bashrc ]; then
   . /etc/bashrc
fi

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

#######################################################
# EXPORTS
#######################################################

# Disable the bell
if [[ $iatest > 0 ]]; then bind "set bell-style visible"; fi

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Allow ctrl-S for history navigation (with ctrl-R)
stty -ixon

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest > 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest > 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# Set the default editor
export EDITOR=nano
export VISUAL=nano
alias pico='edit'
alias spico='sedit'
alias vim='edit'
alias nvim='edit'

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
#export GREP_OPTIONS='--color=auto' #deprecated
alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#######################################################
# MACHINE SPECIFIC ALIAS'S
#######################################################

# Alias's for SSH
# alias SERVERNAME='ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'

# Alias's to change the directory
alias web='cd /var/www/html'

# Alias's to mount ISO files
# mount -o loop /home/NAMEOFISO.iso /home/ISOMOUNTDIR/
# umount /home/NAMEOFISO.iso
# (Both commands done as root only.)

#######################################################
# GENERAL ALIAS'S
#######################################################
# To temporarily bypass an alias, we preceed the command with a \
# EG: the ls command is aliased, but to use the normal ls command you would type \ls

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Edit this .bashrc file
alias ebrc='edit ~/.bashrc'

# Show help for this .bashrc file
alias hlp='less ~/.bashrc_help'

# alias to show the date
alias da='date "+%Y-%m-%d %A %T %Z"'

# Alias's to modified commands
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -iv'
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'
#alias multitail='multitail --no-repeat -c'
#alias freshclam='sudo freshclam'
#alias npm="socket npm"
#alias npx="socket npx"

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# cd into the old directory
alias bd='cd "$OLDPWD"'

# Remove a directory and all files
alias rmd='/bin/rm  --recursive --force --verbose '

# Alias's for multiple directory listing commands
alias la='ls -Alh' # show hidden files
alias ls='ls -aFh --color=always' # add colors and file type extensions
alias lx='ls -lXBh' # sort by extension
alias lk='ls -lSrh' # sort by size
alias lc='ls -lcrh' # sort by change time
alias lu='ls -lurh' # sort by access time
alias lr='ls -lRh' # recursive ls
alias lt='ls -ltrh' # sort by date
alias lm='ls -alh |more' # pipe through 'more'
alias lw='ls -xAh' # wide listing format
alias ll='ls -Fls' # long listing format
alias labc='ls -lap' #alphabetical sort
alias lf="ls -l | egrep -v '^d'" # files only
alias ldir="ls -l | egrep '^d'" # directories only

# alias chmod commands
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# Search command line history
alias h="history | grep "

# Search running processes
alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Search files in the current folder
alias f="find . | grep "

# Count all files (recursively) in the current folder
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"

# To see if a command is aliased, a file, or a built-in command
alias checkcommand="type -t"

# Show current network connections to the server
alias ipview="netstat -anpl | grep :80 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'"

# Show open ports
alias openports='netstat -nape --inet'

# Alias's for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# Show all logs in /var/log
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

# SHA1
alias sha1='openssl sha1'

alias clickpaste='sleep 3; xdotool type "$(xclip -o -selection clipboard)"'

#######################################################
# SPECIAL FUNCTIONS
#######################################################

# Use the best version of pico installed
edit ()
{
	nano "$@"
}
sedit ()
{
	sudo nano "$@"
}

# Extracts any archive(s) (if unp isn't installed)
extract () {
	for archive in $*; do
		if [ -f $archive ] ; then
			case $archive in
				*.tar.bz2)   tar xvjf $archive    ;;
				*.tar.gz)    tar xvzf $archive    ;;
				*.bz2)       bunzip2 $archive     ;;
				*.rar)       rar x $archive       ;;
				*.gz)        gunzip $archive      ;;
				*.tar)       tar xvf $archive     ;;
				*.tbz2)      tar xvjf $archive    ;;
				*.tgz)       tar xvzf $archive    ;;
				*.zip)       unzip $archive       ;;
				*.Z)         uncompress $archive  ;;
				*.7z)        7z x $archive        ;;
				*)           echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}

# Searches for text in all files in the current folder
ftext ()
{
	# -i case-insensitive
	# -I ignore binary files
	# -H causes filename to be printed
	# -r recursive search
	# -n causes line number to be printed
	# optional: -F treat search term as a literal, not a regular expression
	# optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
	grep -iIHrn --color=always "$1" . | less -r
}

# Copy file with a progress bar
cpp()
{
	set -e
	strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
	| awk '{
	count += $NF
	if (count % 10 == 0) {
		percent = count / total_size * 100
		printf "%3d%% [", percent
		for (i=0;i<=percent;i++)
			printf "="
			printf ">"
			for (i=percent;i<100;i++)
				printf " "
				printf "]\r"
			}
		}
	END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
}

# Copy and go to the directory
cpg ()
{
	if [ -d "$2" ];then
		cp $1 $2 && cd $2
	else
		cp $1 $2
	fi
}

# Move and go to the directory
mvg ()
{
	if [ -d "$2" ];then
		mv $1 $2 && cd $2
	else
		mv $1 $2
	fi
}

# Create and go to the directory
mkdirg ()
{
	mkdir -p $1
	cd $1
}

# Goes up a specified number of directories  (i.e. up 4)
up ()
{
	local d=""
	limit=$1
	for ((i=1 ; i <= limit ; i++))
		do
			d=$d/..
		done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}

#Automatically do an ls after each cd
# cd ()
# {
# 	if [ -n "$1" ]; then
# 		builtin cd "$@" && ls
# 	else
# 		builtin cd ~ && ls
# 	fi
# }

# Returns the last 2 fields of the working directory
pwdtail ()
{
	pwd|awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
}

# Show the current distribution
distribution ()
{
	local dtype
	# Assume unknown
	dtype="unknown"
	
	# First test against Fedora / RHEL / CentOS / generic Redhat derivative
	if [ -r /etc/rc.d/init.d/functions ]; then
		source /etc/rc.d/init.d/functions
		[ zz`type -t passed 2>/dev/null` == "zzfunction" ] && dtype="redhat"
	
	# Then test against SUSE (must be after Redhat,
	# I've seen rc.status on Ubuntu I think? TODO: Recheck that)
	elif [ -r /etc/rc.status ]; then
		source /etc/rc.status
		[ zz`type -t rc_reset 2>/dev/null` == "zzfunction" ] && dtype="suse"
	
	# Then test against Debian, Ubuntu and friends
	elif [ -r /lib/lsb/init-functions ]; then
		source /lib/lsb/init-functions
		[ zz`type -t log_begin_msg 2>/dev/null` == "zzfunction" ] && dtype="debian"
	
	# Then test against Gentoo
	elif [ -r /etc/init.d/functions.sh ]; then
		source /etc/init.d/functions.sh
		[ zz`type -t ebegin 2>/dev/null` == "zzfunction" ] && dtype="gentoo"
	
	# For Mandriva we currently just test if /etc/mandriva-release exists
	# and isn't empty (TODO: Find a better way :)
	elif [ -s /etc/mandriva-release ]; then
		dtype="mandriva"

	# For Slackware we currently just test if /etc/slackware-version exists
	elif [ -s /etc/slackware-version ]; then
		dtype="slackware"

	fi
	echo $dtype
}

# Show the current version of the operating system
ver ()
{
	local dtype
	dtype=$(distribution)

	if [ $dtype == "redhat" ]; then
		if [ -s /etc/redhat-release ]; then
			cat /etc/redhat-release && uname -a
		else
			cat /etc/issue && uname -a
		fi
	elif [ $dtype == "suse" ]; then
		cat /etc/SuSE-release
	elif [ $dtype == "debian" ]; then
		lsb_release -a
		# sudo cat /etc/issue && sudo cat /etc/issue.net && sudo cat /etc/lsb_release && sudo cat /etc/os-release # Linux Mint option 2
	elif [ $dtype == "gentoo" ]; then
		cat /etc/gentoo-release
	elif [ $dtype == "mandriva" ]; then
		cat /etc/mandriva-release
	elif [ $dtype == "slackware" ]; then
		cat /etc/slackware-version
	else
		if [ -s /etc/issue ]; then
			cat /etc/issue
		else
			echo "Error: Unknown distribution"
			exit 1
		fi
	fi
}

# Automatically install the needed support files for this .bashrc file
install_bashrc_support ()
{
	local dtype
	dtype=$(distribution)

	if [ $dtype == "redhat" ]; then
		sudo yum install multitail tree joe
	elif [ $dtype == "suse" ]; then
		sudo zypper install multitail
		sudo zypper install tree
		sudo zypper install joe
	elif [ $dtype == "debian" ]; then
		sudo apt-get install multitail tree joe
	elif [ $dtype == "gentoo" ]; then
		sudo emerge multitail
		sudo emerge tree
		sudo emerge joe
	elif [ $dtype == "mandriva" ]; then
		sudo urpmi multitail
		sudo urpmi tree
		sudo urpmi joe
	elif [ $dtype == "slackware" ]; then
		echo "No install support for Slackware"
	else
		echo "Unknown distribution"
	fi
}

# Show current network information
netinfo ()
{
	echo "--------------- Network Information ---------------"
	/sbin/ifconfig | awk /'inet addr/ {print $2}'
	echo ""
	/sbin/ifconfig | awk /'Bcast/ {print $3}'
	echo ""
	/sbin/ifconfig | awk /'inet addr/ {print $4}'

	/sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
	echo "---------------------------------------------------"
}

# IP address lookup
alias whatismyip="whatsmyip"
function whatsmyip ()
{
	# Dumps a list of all IP addresses for every device
	# /sbin/ifconfig |grep -B1 "inet addr" |awk '{ if ( $1 == "inet" ) { print $2 } else if ( $2 == "Link" ) { printf "%s:" ,$1 } }' |awk -F: '{ print $1 ": " $3 }';

	# Internal IP Lookup
	echo -n "Internal IP: " ; /sbin/ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'

	# External IP Lookup
	echo -n "External IP: " ; wget http://smart-ip.net/myip -O - -q
}




# For some reason, rot13 pops up everywhere
rot13 () {
	if [ $# -eq 0 ]; then
		tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
	else
		echo $* | tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
	fi
}

# Trim leading and trailing spaces (for scripts)
trim()
{
	local var=$@
	var="${var#"${var%%[![:space:]]*}"}"  # remove leading whitespace characters
	var="${var%"${var##*[![:space:]]}"}"  # remove trailing whitespace characters
	echo -n "$var"
}

alias lookingglass="~/looking-glass-B5.0.1/client/build/looking-glass-client -F"

#######################################################
# Set the ultimate amazing command prompt
#######################################################

alias cpu="grep 'cpu ' /proc/stat | awk '{usage=(\$2+\$4)*100/(\$2+\$4+\$5)} END {print usage}' | awk '{printf(\"%.1f\n\", \$1)}'"

export PATH=$PATH:"$HOME/.local/bin:$HOME/.cargo/bin"

# Install Starship - curl -sS https://starship.rs/install.sh | sh

eval "$(starship init bash)"

#Autojump

. /usr/share/autojump/autojump.sh



# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

