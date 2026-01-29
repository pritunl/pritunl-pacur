#!/bin/bash
sudo python3 autoindex.py stable
s3c mirror --remove /home/cloud/git/pritunl-pacur-stable/mirror/ r2-east:/stable/
s3c mirror --remove /home/cloud/git/pritunl-pacur-stable/mirror/ r2-west:/stable/
s3c mirror --remove /home/cloud/git/pritunl-pacur-stable/mirror/ vultr-east:/stable/
