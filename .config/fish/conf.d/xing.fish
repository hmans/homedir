if test -d /Users/hmans/.oly/bin
  set PATH /Users/hmans/.oly/bin $PATH
end

alias kubectl-main-production "kubectl --context kubernetes.main.production.ams1"
alias kubectl-misc-production "kubectl --context kubernetes.misc.production.ams1"
alias kubectl-main-preview "kubectl --context kubernetes.main.preview.ams1"
alias kubectl-misc-preview "kubectl --context kubernetes.misc.preview.ams1"


# mysql fix
set PATH /usr/local/opt/mysql@5.7/bin/ $PATH

function xing-rest-preview
  set url "http://rest.api.preview.ams1.xing.com/rest$argv"
  echo "Requesting: GET $url"
  oly run command -d ams1 -n people -a network-api -e preview -- curl -v $url
end

function xing-rest-production
  set url "http://rest.api.ams1.xing.com/rest$argv"
  echo "Requesting: GET $url"
  oly run command -d ams1 -n people -a network-api -e production -- curl -v $url
end

# alias xing-rest-preview "oly run command -d ams1 -n people -a network-api -e preview -- curl \"http://rest.api.preview.ams1.xing.com/rest/profiles/profiles/3?rid=3&fields=id\""
# alias xing-rest-production "oly run command -d ams1 -n people -a network-api -e production -- curl \"http://rest.api.ams1.xing.com/rest/profiles/profiles/3?rid=3&fields=id\""

# Upload Gems to gems.xing.com
function upload_xing_gem
  set gem_file $argv
  echo "uploading $gem_file"
  curl -F file={$gem_file} http://gems.xing.com/upload
end
