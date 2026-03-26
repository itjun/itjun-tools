#!/bin/bash
set -e

# 从远程仓库拉取 sources.list 并强制覆盖
GITHUB_URL="https://raw.githubusercontent.com/itjun/itjun-tools/main/debian/sources.list"
GITEE_URL="https://gitee.com/shenzhenitjun/itjun-tools/raw/main/debian/sources.list"

echo "[INFO] Downloading sources.list..."
if wget -q -O /etc/apt/sources.list "$GITHUB_URL"; then
    echo "[INFO] Downloaded from GitHub"
else
    echo "[WARN] GitHub download failed, trying Gitee..."
    if wget -q -O /etc/apt/sources.list "$GITEE_URL"; then
        echo "[INFO] Downloaded from Gitee"
    else
        echo "[ERROR] Failed to download sources.list from both GitHub and Gitee"
        exit 1
    fi
fi

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
