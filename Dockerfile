FROM n8nio/n8n:latest

USER root

# 1. Manually reinstall apk-tools (Workaround for n8n 2.1.0+ optimization)
RUN wget -q https://dl-cdn.alpinelinux.org/alpine/v3.22/main/x86_64/apk-tools-2.14.8-r0.apk && \
    tar -xzf apk-tools-2.14.8-r0.apk -C / && \
    rm apk-tools-2.14.8-r0.apk

# 2. Now 'apk' is back, we can install Tailscale
RUN apk add --no-cache ca-certificates tailscale

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]