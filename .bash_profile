#!/bin/bash

function source_dir () {
  local DIR=$1

  if [ -d $DIR ]; then
    for file in $DIR/*.sh; do
      if [ -f "$file" ]; then
        source "$file"
      fi
    done
  fi
}

source_dir "$HOME/.bash_profile.d"
source_dir "$HOME/.bash_profile.$(uname).d"
source_dir "$HOME/.bash_profile.local.d"
