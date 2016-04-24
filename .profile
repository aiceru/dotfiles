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

# for Git-completion
if [ -f ~/.bash_scripts/.git-completion.bash ]; then
	. ~/.bash_scripts/.git-completion.bash
fi

export TERM="xterm-color"
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export GREP_OPTIONS='--color=auto'

# User specific aliases and functions
PS1="$C_WHITE\D{%H:%M:%S} $C_DEFAULT[$C_LIGHTPURPLE\u$C_DEFAULT@$C_LIGHTYELLOW\h $C_LIGHTGREEN\w$C_DEFAULT]\$ "
ulimit -c unlimited
ulimit -n 4096

# for Go
export GOPATH=/Users/iceru/PrivateDev/GoBook

# for Maven
export MAVEN_HOME=/usr/local/mvn/apache-maven-3.3.9
export PATH=$PATH:$MAVEN_HOME/bin

# for Ant
export ANT_HOME=/usr/local/ant/apache-ant-1.9.6
export PATH=$PATH:$ANT_HOME/bin;

# for ARCUS
export WORK_HOME=$HOME/Work
export ARCUS_HOME=$WORK_HOME/arcus/repo/naver/arcus
export ARCUS_SCRIPTS=$ARCUS_HOME/scripts
export ARCUS_ZOO=$ARCUS_HOME/zookeeper/bin
export PATH=$PATH:$ARCUS_SCRIPTS:$ARCUS_ZOO
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ARCUS_HOME/lib
export ARCUS_DEV_REPO=$WORK_HOME/arcus/repo/aiceru

# for Git
export PATH=/usr/local/git/bin:$PATH

# for GNU Libraries (brew coreutils)
#export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
# for GNU gcc
export PATH="/usr/local/gcc-5.3.0/bin:$PATH"
# for libtool(ize) 
export PATH="/usr/local/Cellar/libtool/2.4.6/bin:$PATH"
# for bison
export PATH="/usr/local/Cellar/bison/3.0.4/bin:$PATH"

# SERVER address
export M002_ADDR='125.209.200.190'
# for Arcus (memcached)
export ARCUS_CACHE_PUBLIC_IP='127.0.0.1'

# for Arcus-Hubble
#export COLLECTD_HOME=$HOME/test/arcus-collectd

alias psgrep='ps -ef | grep -v "root " | grep -v "sshd:" | grep -v "\-bash" | grep -v "ps" | grep -v "grep" | grep $USER'
#alias psgrep='ps -ef | grep $USER'

alias sp='source ~/.profile'
alias ls='ls -GFh'
alias ll='ls -GFhl'
alias la='ls -GFhal'
alias fc='find . -name "*[ch]" -print | xargs grep $1 -H -n'
alias fj='find . -name "*.java" -print | xargs grep $1 -H -n'

alias treev='tree -hvL $1'
alias treet='tree -htL $1'

# for coreutils
alias readlink='greadlink'

# VImproved
alias vimt='vi -p$# $*'

# MAVEN alias
alias mvnpackage='mvn package -Dmaven.test.skip=true'

# SSH alias
alias m002ssh='ssh wooseok.son@$M002_ADDR'

alias go_c_client='cd ~/Work/arcus/repo/aiceru/arcus-c-client'
alias go_acp='cd ~/Work/arcus/repo/jam2in/arcus-misc/acp-java'
alias go_arcus_scripts='cd $ARCUS_SCRIPTS'
alias sp='source ~/.profile'
