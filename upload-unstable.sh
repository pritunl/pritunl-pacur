#!/bin/bash
sudo python3 autoindex.py stable
s3c mirror --remove /home/cloud/git/pritunl-pacur/mirror/ r2-east:/unstable/
s3c mirror --remove /home/cloud/git/pritunl-pacur/mirror/ r2-west:/unstable/
s3c mirror --remove /home/cloud/git/pritunl-pacur/mirror/ vultr-east:/unstable/
