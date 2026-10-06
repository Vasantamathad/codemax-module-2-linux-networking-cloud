#!/usr/bin/env bash
set -e

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_FILE="$ROOT_DIR/website/index.html"
TARGET_FILE="/var/www/html/index.html"

echo "===== Deploy Nginx Website ====="

if [ ! -f "$SOURCE_FILE" ]; then
    echo "ERROR: $SOURCE_FILE not found."
    exit 1
fi

sudo cp "$SOURCE_FILE" "$TARGET_FILE"
sudo chown root:root "$TARGET_FILE"
sudo chmod 644 "$TARGET_FILE"

sudo nginx -t
sudo systemctl reload nginx

echo
echo "Local test:"
curl -I http://127.0.0.1

echo
echo "===== Deployment complete ====="
echo "Open http://<SERVER_IP> from your browser."
