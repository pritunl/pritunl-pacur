if [ ! -n "$1" ]; then
  echo "target unset"
  exit 1
fi

sudo rsync --human-readable --archive --xattrs --progress --delete --super /home/cloud/git/pritunl-pacur/$1/ /home/cloud/git/pritunl-pacur-stable/$1/
