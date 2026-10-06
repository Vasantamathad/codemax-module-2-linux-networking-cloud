#!/usr/bin/env bash
set -u

echo "===== Network Check ====="

echo
echo "Hostname:"
hostname

echo
echo "IP addresses:"
ip -br addr 2>/dev/null || hostname -I

echo
echo "Routes:"
ip route 2>/dev/null || true

echo
echo "DNS:"
if command -v getent >/dev/null 2>&1; then
    getent hosts example.com || true
fi

echo
echo "Listening TCP/UDP ports:"
ss -tulpn 2>/dev/null | head -n 25 || true

echo
echo "HTTP headers:"
curl -I --max-time 10 https://example.com 2>/dev/null | head -n 8 || true

echo
echo "===== Done ====="
