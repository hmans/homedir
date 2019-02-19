if test -d /Users/hmans/.oly/bin
  set PATH /Users/hmans/.oly/bin $PATH
end

alias kubectl-main-production "kubectl --context kubernetes.main.production.ams1"
alias kubectl-misc-production "kubectl --context kubernetes.misc.production.ams1"
alias kubectl-main-preview "kubectl --context kubernetes.main.preview.ams1"
alias kubectl-misc-preview "kubectl --context kubernetes.misc.preview.ams1"
