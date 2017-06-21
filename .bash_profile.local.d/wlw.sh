# WLW specific aliases
alias doco="docker-compose -f /Users/mans/src/docker-compose/docker-compose.yml"
alias de="dexec"

function dexec {
  APP=${PWD##*/}
  CMD="doco exec $APP $@"

  fortune | cowsay
  echo ""
  echo "🚀  Launching into '$APP'."
  eval $CMD
}
