# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ "$OSTYPE" == "linux-gnu" ]; then
  # .bashrc
  # Source global definitions
  if [ -f /etc/bashrc ]; then
    . /etc/bashrc
  fi
  # for Git-completion
  if [ -f ~/.bash_scripts/.git-completion.sh ]; then
    source ~/.bash_scripts/.git-completion.sh
  fi
  # for Git-prompt
  if [ -f ~/.bash_scripts/.git-prompt.sh ]; then
    source ~/.bash_scripts/.git-prompt.sh
  fi
fi

################## Common ###########################

# define colors
C_DEFAULT="\[\033[m\]"
C_WHITE="\[\033[1m\]"
C_BLACK="\[\033[30m\]"
C_RED="\[\033[31m\]"
C_GREEN="\[\033[32m\]"
C_YELLOW="\[\033[33m\]"
C_BLUE="\[\033[34m\]"
C_PURPLE="\[\033[35m\]"
C_CYAN="\[\033[36m\]"
C_LIGHTGRAY="\[\033[37m\]"
C_DARKGRAY="\[\033[1;30m\]"
C_LIGHTRED="\[\033[1;31m\]"
C_LIGHTGREEN="\[\033[1;32m\]"
C_LIGHTYELLOW="\[\033[1;33m\]"
C_LIGHTBLUE="\[\033[1;34m\]"
C_LIGHTPURPLE="\[\033[1;35m\]"
C_LIGHTCYAN="\[\033[1;36m\]"
C_BG_BLACK="\[\033[40m\]"
C_BG_RED="\[\033[41m\]"
C_BG_GREEN="\[\033[42m\]"
C_BG_YELLOW="\[\033[43m\]"
C_BG_BLUE="\[\033[44m\]"
C_BG_PURPLE="\[\033[45m\]"
C_BG_CYAN="\[\033[46m\]"
C_BG_LIGHTGRAY="\[\033[47m\]"

export TERM="xterm-color"

# User specific aliases and functions
PS1="$C_WHITE\D{%H:%M:%S} $C_DEFAULT[$C_LIGHTPURPLE\u$C_DEFAULT@$C_LIGHTYELLOW\h $C_LIGHTGREEN\W$C_PURPLE"'$(__git_ps1 " (%s)")'"$C_DEFAULT]\$ "
ulimit -c unlimited
ulimit -n 4096

# for Git
#export PATH=/usr/local/git/bin:$PATH

# for GoLang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/PrivateDev/go
export PATH=$PATH:$GOPATH/bin:$HOME/.gotools
export GOBIN=$GOPATH/bin

# for global CC & CXX
export CC=gcc
export CXX=g++

# set '--color' options because we use GNU ls, not FreeBSD's ls!!
alias ls='ls -GFh --color'
alias ll='ls -GFhl --color'
alias la='ls -GFhal --color'

alias sp='source ~/.profile'
alias fc='find . -name "*[ch]" -print | xargs grep $1 -H -n'
alias fj='find . -name "*.java" -print | xargs grep $1 -H -n'

alias treev='tree -hvL $1'
alias treet='tree -htL $1'

alias cd_go-path='cd $GOPATH'
