#!/bin/bash
# DragonStack Setup Script / 龙栈安装脚本
# Copyright (c) 2026 OASYS CORE INTERNATIONAL LIMITED / 潤芯國際(香港)有限公司

set -e

echo "🐉 DragonStack Setup / 龙栈安装"
echo "================================"
echo ""

# Colors / 颜色
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check prerequisites / 检查前置条件
echo "📋 Checking prerequisites / 检查前置条件..."

# Check Git
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Git is not installed / Git 未安装${NC}"
    exit 1
fi
echo -e "${GREEN}✅ Git installed / Git 已安装${NC}"

# Check Node.js
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js is not installed / Node.js 未安装${NC}"
    exit 1
fi
echo -e "${GREEN}✅ Node.js installed / Node.js 已安装${NC}"

# Detect AI platform / 检测 AI 平台
echo ""
echo "🔍 Detecting AI platforms / 检测 AI 平台..."

PLATFORM=""
if command -v trae &> /dev/null || [ -d "/Applications/Trae.app" ]; then
    echo -e "${GREEN}✅ Trae detected / 检测到 Trae${NC}"
    PLATFORM="trae"
elif command -v cursor &> /dev/null || [ -d "/Applications/Cursor.app" ]; then
    echo -e "${GREEN}✅ Cursor detected / 检测到 Cursor${NC}"
    PLATFORM="cursor"
else
    echo -e "${YELLOW}⚠️ No AI platform detected / 未检测到 AI 平台${NC}"
    echo "Please install Trae or Cursor / 请安装 Trae 或 Cursor"
    PLATFORM="trae"  # Default / 默认
fi

# Setup project / 设置项目
echo ""
echo "🔧 Setting up DragonStack / 设置龙栈..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Copy templates / 复制模板
echo "📄 Copying templates / 复制模板..."
# Convert platform to uppercase for template filename (兼容 macOS Bash 3.2)
PLATFORM_UPPER=$(echo "$PLATFORM" | tr '[:lower:]' '[:upper:]')
if [ -f "$SCRIPT_DIR/templates/${PLATFORM_UPPER}.md.template" ]; then
    cp "$SCRIPT_DIR/templates/${PLATFORM_UPPER}.md.template" ./DRAGONSTACK.md
    echo -e "${GREEN}✅ Created DRAGONSTACK.md for $PLATFORM${NC}"
else
    echo -e "${YELLOW}⚠️ Template not found, using default / 模板未找到，使用默认${NC}"
    cat > ./DRAGONSTACK.md << 'EOF'
# DragonStack Configuration / 龙栈配置

## Platform / 平台
- Default: Trae
- Alternative: Cursor

## Skills / 技能
See /docs/skills.md for full list.

## Usage / 使用
Run `/brainstorm` to start a new project.
EOF
fi

# Create config / 创建配置
echo "⚙️ Creating configuration / 创建配置..."
mkdir -p ./.dragonstack
cat > ./.dragonstack/config.yaml << EOF
# DragonStack Configuration / 龙栈配置
platform: $PLATFORM
version: "1.0.0"

# Safety settings / 安全设置
safety:
  careful_mode: true
  freeze_on_start: false

# Skill settings / 技能设置
skills:
  auto_update: true
  check_interval: 86400  # 24 hours

# Logging / 日志
logging:
  level: info
  file: ./.dragonstack/logs/dragonstack.log
EOF

echo -e "${GREEN}✅ Configuration created / 配置已创建${NC}"

# Verify installation / 验证安装
echo ""
echo "🔍 Verifying installation / 验证安装..."

if [ -f "./DRAGONSTACK.md" ] && [ -f "./.dragonstack/config.yaml" ]; then
    echo -e "${GREEN}✅ DragonStack setup complete! / 龙栈安装完成！${NC}"
    echo ""
    echo "📚 Next steps / 下一步:"
    echo "   1. Open your AI assistant / 打开你的 AI 助手"
    echo "   2. Run /brainstorm to start / 运行 /brainstorm 开始"
    echo "   3. Read docs/skills.md for all commands / 阅读 docs/skills.md 查看所有命令"
    echo ""
    echo "🐉 Happy coding! / 编码愉快！"
else
    echo -e "${RED}❌ Setup incomplete / 安装不完整${NC}"
    exit 1
fi
