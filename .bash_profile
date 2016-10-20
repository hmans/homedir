#!/bin/bash

shopt -s nullglob

function source_dir () {
  local DIR=$1

  if [ -d $DIR ]; then
    for file in $DIR/*.sh; do
      source "$file"
    done
  fi
}

source_dir "$HOME/.bash_profile.d"
source_dir "$HOME/.bash_profile.$(uname).d"
source_dir "$HOME/.bash_profile.local.d"
