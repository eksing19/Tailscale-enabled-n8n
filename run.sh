#!/bin/sh

# Start Tailscale in background
tailscaled --tun=userspace-networking --socks5-server=localhost:1055 &

# Wait for it to boot
sleep 3

# Login using the variable from Render's Dashboard
# The key is NEVER saved in this file or GitHub
tailscale up --authkey=${TAILSCALE_AUTHKEY} --hostname=render-n8n --accept-routes

# Start n8n
exec n8n