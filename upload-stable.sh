sudo python3 autoindex.py stable
sudo podman run --rm -v /home/cloud/.mc:/root/.mc:Z -v /home/cloud/git/pritunl-pacur-stable/mirror:/mirror:Z localhost/tools mirror --remove --overwrite --md5 /mirror r2/pritunl-repo/stable
