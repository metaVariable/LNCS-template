FROM ubuntu:19.04

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    curl \
    python3 \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app
WORKDIR /app

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
