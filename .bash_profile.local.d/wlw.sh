# WLW specific aliases

# shortcut for docker-compose
function doco {
  docker-compose -f /Users/mans/src/docker-compose/docker-compose.yml $@
}

# shortcut to run a command within a project's container
function dexec {
  APP=${PWD##*/}
  CMD="doco exec $APP $@"

  fortune | cowsay
  echo ""
  echo "🚀  Launching into '$APP'."
  eval $CMD
}

alias de="dexec"
