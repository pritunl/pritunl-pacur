#!/bin/bash
sudo podman run --rm -v /home/cloud/.mc:/root/.mc:Z -v /home/cloud/git/pritunl-pacur-stable/mirror:/mirror:Z localhost/tools mirror --summary --remove --overwrite --md5 --retry --checksum=MD5 --disable-multipart /mirror vultr-east/repo.pritunl.com/stable
sudo podman run --rm -v /home/cloud/.mc:/root/.mc:Z -v /home/cloud/git/pritunl-pacur-stable/mirror:/mirror:Z localhost/tools mirror --summary --remove --overwrite --md5 --retry --checksum=MD5 --disable-multipart /mirror r2/pritunl-repo-east/stable
sudo podman run --rm -v /home/cloud/.mc:/root/.mc:Z -v /home/cloud/git/pritunl-pacur-stable/mirror:/mirror:Z localhost/tools mirror --summary --remove --overwrite --md5 --retry --checksum=MD5 --disable-multipart /mirror r2/pritunl-repo-west/stable
