#!/usr/bin/env bash
set -u

echo "===== Connectivity Test ====="

TARGET="${1:-127.0.0.1}"

echo
echo "Target: $TARGET"

echo
echo "1. DNS resolution for example.com:"
getent hosts example.com || true

echo
echo "2. Ping target:"
ping -c 4 "$TARGET" || true

echo
echo "3. TCP port 80:"
if command -v nc >/dev/null 2>&1; then
    nc -vz "$TARGET" 80 || true
else
    echo "nc is not installed; using curl instead."
fi

echo
echo "4. HTTP test:"
curl -I --max-time 10 "http://$TARGET" || true

echo
echo "5. Listening ports:"
ss -tulpn 2>/dev/null | head -n 30 || true

echo
echo "===== Test complete ====="
