#!/bin/bash

NOW=$(date +%s)

run () {
  echo $@
  $@
}

install () {
  SRC="$PWD/$1"
  DEST="$HOME/$1"

  if [ -h "$DEST" ]; then      # if $DEST is a symlink, we can probably delete it.
    echo "❌  Removing symlink $DEST"
    run rm "$DEST"
  elif [ -e "$DEST" ]; then
    echo "💾  Backing up $DEST"
    run mv "$DEST" "$DEST.orig-$NOW"
  fi
  run ln -s "$SRC" "$DEST"
}

shopt -s dotglob extglob

for F in !(.|..|README.markdown|install.sh|.git|.gitmodules|.gitignore|.DS_Store); do
  install ${F}
done
