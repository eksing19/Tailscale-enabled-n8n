FROM n8nio/n8n:latest

USER root
# Install Tailscale
RUN apk add --no-cache ca-certificates tailscale

# Copy the boot script
COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]