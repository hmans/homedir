function upload_gem
  set gem_file $1
  echo "uploading $gem_file"
  curl -F file=$gem_file http://gems.xing.com/upload
end

