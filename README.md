# Debian Minimal Setup

## 一键初始化（推荐）

在新系统上执行：

```bash
wget -O init.sh https://gitee.com/mimrc/summer-install/raw/itjun-debian/debian/init.sh
chmod +x init.sh
sudo ./init.sh
```

该脚本会自动：
1. 下载并覆盖 `/etc/apt/sources.list`
2. 更新软件包列表
3. 升级系统
4. 安装基础软件包（openssh-server, vim, curl, wget, sudo, tree, ca-certificates）
5. 启用 SSH

---

## 手动执行

如果需要手动分步执行：

```bash
# 1. 下载 sources.list 并覆盖
wget -O /etc/apt/sources.list https://gitee.com/mimrc/summer-install/raw/itjun-debian/debian/sources.list

# 2. 更新并升级
apt update && apt upgrade -y

# 3. 安装基础软件
apt install -y \
    openssh-server \
    vim \
    curl \
    wget \
    sudo \
    tree \
    ca-certificates

# 4. 启用 SSH
systemctl enable ssh
```

---

## 源文件

- `debian/init.sh` - 初始化脚本
- `debian/sources.list` - Debian 镜像源配置（南京大学镜像，Debian 13 Trixie）
