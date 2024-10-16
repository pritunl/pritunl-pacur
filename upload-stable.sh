read -p "UPLOAD STABLE (y/n)? " CONT
if [ "$CONT" != "y" ]; then
  exit;
fi

sudo podman run --rm -v /home/cloud/.mc:/root/.mc:Z -v /home/cloud/git/pritunl-pacur-stable/mirror:/mirror:Z localhost/tools mirror --remove --overwrite --md5 /mirror repo-east/stable
sudo podman run --rm -v /home/cloud/.mc:/root/.mc:Z -v /home/cloud/git/pritunl-pacur-stable/mirror:/mirror:Z localhost/tools mirror --remove --overwrite --md5 /mirror repo-west/stable
