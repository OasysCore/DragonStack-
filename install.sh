#!/bin/bash
# DragonStack Install/Update - Interactive Setup / 龙栈安装/更新向导
# Copyright (c) 2026 OASYS CORE INTERNATIONAL LIMITED / 潤芯國際(香港)有限公司

set -e

echo "🐉 DragonStack Install/Update / 龙栈安装/更新"
echo "=============================================="
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Check if already installed
if [ -d "$HOME/.dragonstack" ]; then
    echo -e "${YELLOW}⚠️ DragonStack already exists at ~/.dragonstack${NC}"
    echo ""
    read -p "Update to latest version? / 更新到最新版本? (yes/no): " UPDATE
    if [ "$UPDATE" == "yes" ]; then
        echo ""
        echo "🔄 Updating DragonStack..."
        cd "$HOME/.dragonstack"
        git pull origin main
        echo ""
        echo -e "${GREEN}✅ DragonStack updated!${NC}"
        echo ""
        echo "📋 What's new:"
        git log --oneline -3
        echo ""
        echo "🐉 Ready to use!"
        exit 0
    else
        echo ""
        echo -e "${YELLOW}⚠️ Skipping update${NC}"
        echo "Using existing version / 使用现有版本"
        exit 0
    fi
fi

# Check prerequisites
echo "📋 Checking prerequisites..."
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Git not installed${NC}"
    exit 1
fi
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js not installed${NC}"
    exit 1
fi
echo -e "${GREEN}✅ Prerequisites OK${NC}"
echo ""

# Clone repository
echo "📥 Installing DragonStack..."
git clone https://github.com/OasysCore/DragonStack-.git "$HOME/.dragonstack"
echo -e "${GREEN}✅ Installation complete!${NC}"
echo ""

# Show version
cd "$HOME/.dragonstack"
echo "📦 Installed version:"
git log --oneline -1
echo ""

# Next steps
echo "🚀 Next step - Create your first project:"
echo ""
echo "   ~/.dragonstack/scripts/onboard.sh"
echo ""
echo "🐉 Happy coding!"
