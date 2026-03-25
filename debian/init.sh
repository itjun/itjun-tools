#!/bin/bash
set -e

# 从远程仓库拉取 sources.list 并强制覆盖
SOURCES_LIST_URL="https://raw.githubusercontent.com/itjun/itjun-tools/main/debian/sources.list"

echo "[INFO] Downloading sources.list..."
wget -q -O /etc/apt/sources.list "$SOURCES_LIST_URL" || {
    echo "[ERROR] Failed to download sources.list"
    exit 1
}

echo "[INFO] Updating package lists..."
apt update -y

echo "[INFO] Upgrading packages..."
apt upgrade -y

echo "[INFO] Installing essential packages..."
apt install -y \
    openssh-server \
    vim \
    curl \
    wget \
    sudo \
    tree \
    ca-certificates

echo "[INFO] Enabling SSH..."
systemctl enable ssh

echo "[INFO] Done! init.sh completed successfully."
