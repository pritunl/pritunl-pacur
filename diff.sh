#!/bin/bash
rsync --human-readable --archive --xattrs --progress --super --dry-run --delete \
  --exclude /.git \
  --exclude /mirror \
  /home/cloud/git/pritunl-pacur/ /home/cloud/git/pritunl-pacur-stable/
