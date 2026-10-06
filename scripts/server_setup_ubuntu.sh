#!/usr/bin/env bash
set -e

echo "===== Ubuntu Server Basic Setup ====="

if [ "$(id -u)" -ne 0 ]; then
    SUDO="sudo"
else
    SUDO=""
fi

echo "[1/5] Updating package index..."
$SUDO apt update

echo "[2/5] Installing useful packages..."
$SUDO apt install -y nginx curl git ufw dnsutils

echo "[3/5] Enabling Nginx..."
$SUDO systemctl enable --now nginx

echo "[4/5] Checking Nginx..."
$SUDO systemctl --no-pager status nginx | head -n 15

echo "[5/5] Firewall reminder"
echo "Before enabling UFW on a remote server, allow SSH from your public IP:"
echo "  sudo ufw allow from <YOUR_PUBLIC_IP> to any port 22 proto tcp"
echo "Then allow HTTP:"
echo "  sudo ufw allow 80/tcp"
echo "Then enable:"
echo "  sudo ufw enable"

echo
echo "===== Setup complete ====="
