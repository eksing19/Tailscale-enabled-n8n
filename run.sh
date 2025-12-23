#!/bin/sh

# Start Tailscale in background (using userspace for Render)
tailscaled --tun=userspace-networking --socks5-server=localhost:1055 &

# Wait for boot
sleep 5

# Login using your secret key from Render Dashboard
tailscale up --authkey=${TAILSCALE_AUTHKEY} --hostname=render-n8n --accept-routes

# Start n8n
exec n8n