#!/bin/bash
# DragonStack Upgrade Script / 龙栈升级脚本
# Copyright (c) 2026 OASYS CORE INTERNATIONAL LIMITED / 潤芯國際(香港)有限公司

set -e

echo "🐉 DragonStack Upgrade / 龙栈升级"
echo "=================================="
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

DRAGONSTACK_HOME="${HOME}/.dragonstack"
BACKUP_DIR="${HOME}/.dragonstack_backup_$(date +%Y%m%d_%H%M%S)"

echo "📦 Checking for updates / 检查更新..."

# Backup current installation / 备份当前安装
echo "💾 Creating backup / 创建备份..."
if [ -d "$DRAGONSTACK_HOME" ]; then
    mkdir -p "$BACKUP_DIR"
    cp -R "$DRAGONSTACK_HOME" "$BACKUP_DIR"
    echo -e "${GREEN}✅ Backup created at / 备份创建于: $BACKUP_DIR${NC}"
fi

# Pull latest changes / 拉取最新代码
echo "📥 Downloading latest version / 下载最新版本..."
if [ -d "$DRAGONSTACK_HOME/.git" ]; then
    cd "$DRAGONSTACK_HOME"
    git pull origin main
    echo -e "${GREEN}✅ Updated to latest version / 已更新到最新版本${NC}"
else
    echo -e "${YELLOW}⚠️ Not a git repository, skipping pull / 不是 git 仓库，跳过拉取${NC}"
fi

# Re-run setup / 重新运行安装
echo "🔧 Re-running setup / 重新运行安装..."
cd "$DRAGONSTACK_HOME"
./scripts/setup.sh

echo ""
echo -e "${GREEN}✅ Upgrade complete! / 升级完成！${NC}"
echo "📋 Backup location / 备份位置: $BACKUP_DIR"
