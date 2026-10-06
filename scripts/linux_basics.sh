#!/usr/bin/env bash
set -e

echo "===== Linux Basics ====="
echo
echo "User:"
whoami

echo
echo "Hostname:"
hostname

echo
echo "Current directory:"
pwd

echo
echo "Kernel:"
uname -a

echo
echo "OS:"
if command -v lsb_release >/dev/null 2>&1; then
    lsb_release -a
else
    cat /etc/os-release
fi

echo
echo "Disk:"
df -h

echo
echo "Memory:"
free -h

echo
echo "Top processes:"
ps aux --sort=-%cpu | head -n 6

echo
echo "Home directory listing:"
ls -la "$HOME"

echo
echo "===== Done ====="
