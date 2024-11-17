#!/bin/bash
sudo rsync --human-readable --archive --xattrs --progress --delete --super \
  /home/cloud/git/pritunl-pacur/.git/ /home/cloud/git/pritunl-pacur-stable/.git/
sudo rsync --human-readable --archive --xattrs --progress --delete --super \
  /home/cloud/git/pritunl-pacur/tools/ /home/cloud/git/pritunl-pacur-stable/tools/
sudo rsync --human-readable --archive --xattrs --progress --super \
  --include=".gitignore" --include="/*.sh" --include="/*.json" \
  --include="/*.html" --include="/*.py" --include="/*.key" --exclude="/*/" \
  /home/cloud/git/pritunl-pacur/ /home/cloud/git/pritunl-pacur-stable/
