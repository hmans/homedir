# Add bash completion for homebrew installed packages
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# add homebrew's sbin to PATH
export PATH="/usr/local/sbin:$PATH"
