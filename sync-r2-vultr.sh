#!/bin/bash
sudo podman run --rm -v /home/cloud/.mc:/root/.mc:Z -v /home/cloud/git/pritunl-pacur/mirror:/mirror:Z localhost/tools anonymous set download vultr-east/repo.pritunl.com
sudo podman run --rm -v /home/cloud/.mc:/root/.mc:Z -v /home/cloud/git/pritunl-pacur:/mirror:Z localhost/tools cp r2/pritunl-repo-east/index.html vultr-east/repo.pritunl.com/index.html
sudo podman run --rm -v /home/cloud/.mc:/root/.mc:Z -v /home/cloud/git/pritunl-pacur/mirror:/mirror:Z localhost/tools mirror --summary --overwrite --md5 --retry --checksum=MD5 --disable-multipart r2/pritunl-repo-east/kvm-stable/ vultr-east/repo.pritunl.com/kvm-stable/
sudo podman run --rm -v /home/cloud/.mc:/root/.mc:Z -v /home/cloud/git/pritunl-pacur/mirror:/mirror:Z localhost/tools mirror --summary --overwrite --md5 --retry --checksum=MD5 --disable-multipart r2/pritunl-repo-east/kvm-unstable/ vultr-east/repo.pritunl.com/kvm-unstable/
