#!/bin/bash
s3c mirror --remove /home/cloud/git/pritunl-pacur/mirror/apt/ r2-east:/unstable/apt/
s3c mirror --remove /home/cloud/git/pritunl-pacur/mirror/pacman/ r2-east:/unstable/pacman/
s3c mirror --remove /home/cloud/git/pritunl-pacur/mirror/yum/ r2-east:/unstable/yum/
s3c mirror --remove /home/cloud/git/pritunl-pacur/mirror/apt/ r2-west:/unstable/apt/
s3c mirror --remove /home/cloud/git/pritunl-pacur/mirror/pacman/ r2-west:/unstable/pacman/
s3c mirror --remove /home/cloud/git/pritunl-pacur/mirror/yum/ r2-west:/unstable/yum/
s3c index --jobs 30 r2-east:/unstable/
s3c index --jobs 30 r2-west:/unstable/
