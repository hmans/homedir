# chruby-fish
if test -d /opt/homebrew/share/chruby
  set -g -x CHRUBY_ROOT /opt/homebrew
  source /opt/homebrew/share/fish/vendor_functions.d/chruby.fish
end

# linuxbrew
if test -d /home/linuxbrew/.linuxbrew/opt/chruby
  source /home/linuxbrew/.linuxbrew/opt/chruby-fish/share/fish/vendor_functions.d/chruby.fish
  set -g -x CHRUBY_ROOT /home/linuxbrew/.linuxbrew/
end
