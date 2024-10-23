FROM oraclelinux:9

RUN dnf update -y
RUN dnf install -y wget

RUN echo $'[pritunl]\n\
name=Pritunl Repository\n\
baseurl=https://repo.pritunl.com/stable/yum/oraclelinux/9/\n\
gpgcheck=1\n\
enabled=1\n\
gpgkey=https://raw.githubusercontent.com/pritunl/pgp/master/pritunl_repo_pub.asc\n' > /etc/yum.repos.d/pritunl.repo

RUN dnf -y install minio-client

ENTRYPOINT ["/usr/bin/mc"]
CMD ["--version"]
