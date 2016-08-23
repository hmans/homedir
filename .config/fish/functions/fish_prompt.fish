function fish_prompt
  echo
  # line 1: "|{Ruby version}| {hostname} in {current path}"
  if test $RUBY_VERSION
    set_color yellow
    echo -n "|$RUBY_VERSION| "
  end
  set_color purple
  echo -n ( hostname -s )
  set_color white
  echo -n " in "
  set_color green
  pwd

  # line 2: "|{current git branch} ➔ "
  if test -d .git
    echo -n "|"( git branch | grep '* ' | cut -f2- -d " " )"| "
  end
  echo -n "➔  "
  set_color normal
end
