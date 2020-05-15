# chruby-fish
if test -d /usr/local/share/chruby
  source /usr/local/share/chruby/chruby.fish
  source /usr/local/share/chruby/auto.fish
end

# linuxbrew
if test -d /home/linuxbrew/.linuxbrew/opt/chruby
  source /home/linuxbrew/.linuxbrew/opt/chruby-fish/share/chruby/chruby.fish
  source /home/linuxbrew/.linuxbrew/opt/chruby-fish/share/chruby/auto.fish
  set -g -x CHRUBY_ROOT /home/linuxbrew/.linuxbrew/
end
