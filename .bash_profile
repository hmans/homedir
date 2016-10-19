#!/bin/bash

# Source all files found in .bash_profile.d
for file in .bash_profile.d/*.sh; do
  source "$file"
done

# Run OS specific profile
FILENAME="$HOME/.bash_profile.$(uname)"
[ -f $FILENAME ] && source $FILENAME

# Execute local .bash_profile if available
FILENAME="$HOME/.bash_profile.local"
[ -f $FILENAME ] && source $FILENAME
