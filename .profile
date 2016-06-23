if [ "$OSTYPE" == "linux-gnu" ]; then
  # .bashrc
  # Source global definitions
  if [ -f /etc/bashrc ]; then
    . /etc/bashrc
  fi
  # for Git-completion
  if [ -f ~/.bash_scripts/.git-completion.bash ]; then
    . ~/.bash_scripts/.git-completion.bash
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

case $HOSTNAME in 
	jam2in-m002*)
		export MAVEN_HOME=$HOME/bin/apache-maven/apache-maven-3.2.5
		export PATH=$PATH:$MAVEN_HOME/bin
		;;
	*)
		export MAVEN_HOME=/usr/local/mvn/apache-maven-3.3.9
		export PATH=$PATH:$MAVEN_HOME/bin
		export ANT_HOME=/usr/local/ant/apache-ant-1.9.6
		export PATH=$PATH:$ANT_HOME/bin;
	;;		
esac


# for ARCUS
export WORK_HOME=$HOME/Work
export ARCUS_HOME=$WORK_HOME/arcus/repo/naver/arcus
export ARCUS_SCRIPTS=$ARCUS_HOME/scripts
export ARCUS_ZOO=$ARCUS_HOME/zookeeper/bin
export PATH=$PATH:$ARCUS_SCRIPTS:$ARCUS_ZOO
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ARCUS_HOME/lib
export ARCUS_DEV_REPO=$WORK_HOME/arcus/repo/aiceru
export ARCUS_INST=$HOME/Work/arcus/arcus_inst

# for Git
export PATH=/usr/local/git/bin:$PATH

# for GoLang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/PrivateDev/go
export PATH=$PATH:$GOPATH/bin:$HOME/.gotools

# SERVER address
export M002_ADDR='125.209.200.190'
# for Arcus (memcached)
if [ "$HOSTNAME" == "jam2in-m002" ]; then
  export ARCUS_CACHE_PUBLIC_IP=$M002_ADDR
else
  export ARCUS_CACHE_PUBLIC_IP='127.0.0.1'
fi

# set '--color' options because we use GNU ls, not FreeBSD's ls!!
alias ls='ls -GFh --color'
alias ll='ls -GFhl --color'
alias la='ls -GFhal --color'

alias psgrep='ps -ef | grep -v "root " | grep -v "sshd:" | grep -v "\-bash" | grep -v "ps" | grep -v "grep" | grep $USER'

alias sp='source ~/.profile'
alias fc='find . -name "*[ch]" -print | xargs grep $1 -H -n'
alias fj='find . -name "*.java" -print | xargs grep $1 -H -n'

alias treev='tree -hvL $1'
alias treet='tree -htL $1'

# SSH alias
alias m002ssh='ssh wooseok.son@$M002_ADDR'

alias cd_go-path='cd $GOPATH'
alias cd_c-client-jam2in='cd $HOME/Work/arcus/repo/jam2in/arcus-c-client'
alias cd_acp-java-jam2in='cd $HOME/Work/arcus/repo/jam2in/arcus-misc/acp-java'
alias cd_arcus-script-naver='cd $ARCUS_SCRIPTS'
alias cd_java-client-aiceru='cd $WORK_HOME/arcus/repo/aiceru/arcus-java-client'
if [ "$HOSTNAME" == "jam2in-m002" ]; then
  alias sp='source ~/.bashrc'
else
  alias sp='source ~/.profile'
fi

case $OSTYPE in darwin*)
  ################## OS X only ########################

  export CLICOLOR=1
  export LSCOLORS=ExFxCxDxBxegedabagacad
  export GREP_OPTIONS='--color=auto'

  # for Git-completion
  if [ -f ~/.bash_scripts/.git-completion.bash ]; then
    . ~/.bash_scripts/.git-completion.bash
  fi
  # for Git-prompt
  if [ -f ~/.bash_scripts/.git-prompt.sh ]; then
    source ~/.bash_scripts/.git-prompt.sh
  fi

  # for GNU Libraries (brew coreutils)
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
  # for GNU gcc
  export PATH="/usr/local/gcc-5.3.0/bin:$PATH"
  # for libtool(ize) 
  export PATH="/usr/local/Cellar/libtool/2.4.6/bin:$PATH"
  # for bison
  export PATH="/usr/local/Cellar/bison/3.0.4/bin:$PATH"

  # for coreutils
  alias readlink='greadlink'

  export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
esac

# must do this after set PATHs for GNU coreutils in OS X!!
eval $(dircolors -b $HOME/.dircolors)
