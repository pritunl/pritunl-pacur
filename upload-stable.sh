#!/bin/bash
s3c mirror --remove /home/cloud/git/pritunl-pacur-stable/mirror/apt/ r2-east:/stable/apt/
s3c mirror --remove /home/cloud/git/pritunl-pacur-stable/mirror/pacman/ r2-east:/stable/pacman/
s3c mirror --remove /home/cloud/git/pritunl-pacur-stable/mirror/yum/ r2-east:/stable/yum/
s3c mirror --remove /home/cloud/git/pritunl-pacur-stable/mirror/apt/ r2-west:/stable/apt/
s3c mirror --remove /home/cloud/git/pritunl-pacur-stable/mirror/pacman/ r2-west:/stable/pacman/
s3c mirror --remove /home/cloud/git/pritunl-pacur-stable/mirror/yum/ r2-west:/stable/yum/
s3c index --jobs 30 r2-east:/stable/
s3c index --jobs 30 r2-west:/stable/
