#!/bin/bash

# Add local paths
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

# NPM / Node
export NODE_PATH=/usr/local/lib/node_modules:$NODE_PATH
export PATH=/usr/local/share/npm/bin:$PATH
alias npm-exec='PATH=$(npm bin):$PATH'

# Configure prompt. (via http://neverstopbuilding.net/gitpro/)
MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
RESET="\[\e[m\]"
GIT_PS1_SHOWDIRTYSTATE=true

export PS1=$GREEN"★ \u@\h"'$(
    if [[ $(__git_ps1) =~ \*\)$ ]]
    then echo "'$YELLOW'"$(__git_ps1 " (%s)")
    elif [[ $(__git_ps1) =~ \+\)$ ]]
    then echo "'$MAGENTA'"$(__git_ps1 " (%s)")
    else echo "'$CYAN'"$(__git_ps1 " (%s)")
    fi)'$BLUE" \w"$RESET": "

# I like colors.
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'

# Don't check mail when opening terminal.
unset MAILCHECK

# My shortcuts
alias be="bundle exec"
alias ne="npm-exec"
alias ta="tmux attach-session"
alias fs="foreman start"
alias ts="tig status"

# Run OS specific profile
FILENAME="$HOME/.bash_profile.$(uname)"
[ -f $FILENAME ] && source $FILENAME

# Execute local .bash_profile if available
FILENAME="$HOME/.bash_profile.local"
[ -f $FILENAME ] && source $FILENAME
