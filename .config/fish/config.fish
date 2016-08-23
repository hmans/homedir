# chruby-fish
source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish

# Custom stuff
set PATH $PATH /usr/local/mysql/bin
# set -x DYLD_LIBRARY_PATH /usr/local/mysql/lib $DYLD_LIBRARY_PATH
set PATH /usr/local/openresty/bin /usr/local/openresty/nginx/sbin $PATH
set PATH /Applications/Postgres.app/Contents/Versions/9.4/bin $PATH

alias cxss="fswatch-run . 'xing s s'"

