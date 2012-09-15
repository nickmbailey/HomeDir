export PROMPT_COMMAND="history -n; history -a"

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
alias pp='python -mjson.tool'
alias git-clean-local='git branch --merged master | grep -v master | xargs -p -n 1 git branch -d'
alias git-clean-remote='git fetch origin; git remote prune origin; git branch -r --merged master | grep -v master | sed s/origin\\/// | xargs -p -n 1 git push origin --delete'

which ack &> /dev/null
ACK=$?
if [ ! $ACK ]; then
    alias ack='ack-grep '
fi
if [ -e "/usr/local/bin/vim" ]; then
    alias vim='/usr/local/bin/vim '
fi
# mvim overwrites vim
if [ -e "/usr/local/bin/mvim" ]; then
    alias vim='mvim -v '
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

# Prompt
prompt_command () {
    if [ "\$(type -t __git_ps1)" ]; then # if we're in a Git repo, show current branch
            BRANCH="\$(__git_ps1 '%s')"
    fi
    local TIME=`date +%T` # format time for prompt string

    local GREEN="\[\033[0;32m\]"
    local YELLOW="\[\033[0;33m\]"
    local CYAN="\[\033[0;36m\]"
    local BBLACK="\[\033[1;30m\]"
    local BWHITE="\[\033[1;37m\]"

    # return color to Terminal setting for text color
    local DEFAULT="\[\033[0;39m\]"
    local DIR=`pwd|awk -F/ '{print $NF}'`

    export PS1="${BBLACK}[${YELLOW}\h:${BWHITE}${TIME}${BBLACK} ${GREEN}${BRANCH}${BBLACK}] ${CYAN}${DIR}${BWHITE}$ ${DEFAULT}"
}
PROMPT_COMMAND=prompt_command

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
