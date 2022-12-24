#!/bin/sh

# colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# vim
alias vi='nvim'

# python
alias python='python3'
alias pycharm='./programs/pycharm-community-2022.3/bin/pycharm.sh > $XDG_CACHE_HOME/pycharm.log 2>&1 &'

# other
alias x='exit'
alias shutdown='shutdown -h now'
alias bat='batcat'
alias fd='fdfind'

# OS specific aliases
case "$(uname -s)" in

Darwin)
	# echo 'Mac OS X'
	alias ls='ls -G'
	;;

Linux)
	alias ls='ls --color=auto'
	;;

CYGWIN* | MINGW32* | MSYS* | MINGW*)
	# echo 'MS Windows'
	;;
*)
	# echo 'Other OS'
	;;
esac
