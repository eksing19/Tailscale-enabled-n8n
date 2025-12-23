FROM n8nio/n8n:latest

USER root

# Install Tailscale using Debian/Ubuntu commands
RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    tailscale \
    && rm -rf /var/lib/apt/lists/*

# Copy the boot script
COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]