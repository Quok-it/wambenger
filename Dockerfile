FROM nvidia/cuda:12.6.1-cudnn-devel-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update


RUN curl -fsSL https://repo.quok.it/quok.asc | gpg --dearmor -o /etc/apt/trusted.gpg.d/quok.gpg && echo "deb https://repo.quok.it/ cross main" | tee /etc/apt/sources.list.d/quok-stable.list
RUN apt-get update && apt-get install -y quok

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD []
