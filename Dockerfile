FROM debian:12-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    traceroute\
    build-essential \
    curl \
    tcpdump \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /home/sjossain/ft_traceroute

COPY . .

CMD ["/bin/bash"]