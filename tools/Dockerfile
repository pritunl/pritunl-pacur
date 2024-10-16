FROM oraclelinux:9

RUN dnf update -y
RUN dnf install -y wget

RUN gpg --recv-keys 4405F3F0DDBA1B9E68A31D2512C74390F9AAC728
RUN wget https://dl.min.io/client/mc/release/linux-amd64/mc
RUN wget https://dl.min.io/client/mc/release/linux-amd64/mc.asc
RUN gpg --verify mc.asc mc
RUN cp mc /usr/bin/mc
RUN chmod +x /usr/bin/mc

ENTRYPOINT ["/usr/bin/mc"]
CMD ["--version"]
