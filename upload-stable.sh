sudo python3 autoindex.py stable
sudo podman run --rm -v /home/cloud/.mc:/root/.mc:Z -v /home/cloud/git/pritunl-pacur-stable/mirror:/mirror:Z localhost/tools mirror --summary --remove --overwrite --md5 --retry --checksum=MD5 /mirror r2/pritunl-repo/stable
