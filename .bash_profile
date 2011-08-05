alias jgrep='grep -r * --include=*.java -e '
alias pygrep='grep -r * --include=*.py -e '
alias pgrep='ps aux | grep '
alias ls='ls -lahGp '
alias ll='ls -lahGp '
alias vm='vim '
alias rmr='rm -rf '
alias wget='curl -L -O '
alias mvn='mvn -q' # hey maven...shut up
alias gitpull='git pull --rebase '

which ack &> /dev/null
ACK=$?
if [ ! $ACK ]; then
    alias ack='ack-grep '
fi
if [ -e "/usr/local/bin/vim" ]; then
    alias vim='/usr/local/bin/vim '
fi

# MacPorts Installer addition on 2010-11-15_at_12:07:19: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export FIGNORE=.svn:.pyc:.o
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

set -o vi

# extra bash completion
[ -e /etc/bash_completion ] && . /etc/bash_completion
[ -e /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# add a user specific path
export PATH="$PATH:~/bin"

# 256 colors
export TERM=xterm-256color

[ -e .bashrc ] && . .bashrc

[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

if [ -e "/usr/local/bin/brew" ]; then
    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi
fi

[ -e "/usr/local/git/contrib/completion/git-completion.bash" ] && . /usr/local/git/contrib/completion/git-completion.bash
