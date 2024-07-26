read -p "UPLOAD STABLE (y/n)? " CONT
if [ "$CONT" != "y" ]; then
  exit;
fi

mc mirror --remove --overwrite --md5 mirror repo-east/stable
mc mirror --remove --overwrite --md5 mirror repo-west/stable
