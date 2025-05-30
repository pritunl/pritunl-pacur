#!/bin/bash
sudo python3 autoindex.py unstable
sudo podman run --rm -v /home/cloud/.mc:/root/.mc:Z -v /home/cloud/git/pritunl-pacur/mirror:/mirror:Z localhost/tools mirror --summary --remove --overwrite --md5 --retry --checksum=MD5 --disable-multipart /mirror vultr-east/repo.pritunl.com/unstable
