sudo podman build --rm -t tools .
sudo podman run --rm -v /home/cloud/.mc:/root/.mc:Z localhost/tools ls pritunl-repo
