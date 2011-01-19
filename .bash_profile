alias jgrep='grep -r * --include=*.java -e '
alias pygrep='grep -r * --include=*.py -e '
alias pgrep='ps aux | grep '
alias ls='ls -lahGp '
alias ll='ls -lahGp '
alias vm='vim '
alias rmr='rm -rf '
alias wget='curl -L -O '
alias mvn='mvn -q' # hey maven...shut up

# MacPorts Installer addition on 2010-11-15_at_12:07:19: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export FIGNORE=.svn:.pyc:.o
