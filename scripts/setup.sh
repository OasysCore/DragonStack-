#!/bin/bash
# DragonStack Setup Script - Cross Platform / 龙栈安装脚本 - 跨平台版本
# Supports: macOS, Linux, Windows (Git Bash/WSL)
# Copyright (c) 2026 OASYS CORE INTERNATIONAL LIMITED / 潤芯國際(香港)有限公司

set -e

echo "🐉 DragonStack Setup / 龙栈安装"
echo "================================"
echo ""

# Detect OS / 检测操作系统
OS="unknown"
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
    echo "📱 Detected: macOS"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
    echo "🐧 Detected: Linux"
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
    OS="windows"
    echo "🪟 Detected: Windows (Git Bash/Cygwin)"
elif [[ -n "$WSL_DISTRO_NAME" ]]; then
    OS="wsl"
    echo "🐧 Detected: Windows Subsystem for Linux (WSL)"
else
    OS="unknown"
    echo "⚠️ Unknown OS, assuming Unix-like / 未知系统，假设为类 Unix"
fi
echo ""

# Colors / 颜色
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Check prerequisites / 检查前置条件
echo "📋 Checking prerequisites / 检查前置条件..."

# Check Git
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Git is not installed / Git 未安装${NC}"
    echo "Please install Git first / 请先安装 Git"
    echo "  macOS: brew install git"
    echo "  Linux: sudo apt-get install git"
    echo "  Windows: https://git-scm.com/download/win"
    exit 1
fi
echo -e "${GREEN}✅ Git installed / Git 已安装${NC}"

# Check Node.js
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js is not installed / Node.js 未安装${NC}"
    echo "Please install Node.js first / 请先安装 Node.js"
    echo "  https://nodejs.org/"
    exit 1
fi
echo -e "${GREEN}✅ Node.js installed / Node.js 已安装${NC}"

# Detect AI platform / 检测 AI 平台
echo ""
echo "🔍 Detecting AI platforms / 检测 AI 平台..."

PLATFORM=""
TRAe_FOUND=false
CURSOR_FOUND=false

# Check for Trae
if command -v trae &> /dev/null; then
    TRAe_FOUND=true
elif [ "$OS" == "macos" ] && [ -d "/Applications/Trae.app" ]; then
    TRAe_FOUND=true
elif [ "$OS" == "windows" ] && [ -d "/c/Users/$USER/AppData/Local/Trae" ]; then
    TRAe_FOUND=true
elif [ "$OS" == "linux" ] && [ -d "$HOME/.local/share/Trae" ]; then
    TRAe_FOUND=true
fi

# Check for Cursor
if command -v cursor &> /dev/null; then
    CURSOR_FOUND=true
elif [ "$OS" == "macos" ] && [ -d "/Applications/Cursor.app" ]; then
    CURSOR_FOUND=true
elif [ "$OS" == "windows" ] && [ -d "/c/Users/$USER/AppData/Local/Programs/cursor" ]; then
    CURSOR_FOUND=true
elif [ "$OS" == "linux" ] && [ -d "/usr/share/cursor" ]; then
    CURSOR_FOUND=true
fi

# Select platform
if [ "$TRAe_FOUND" == true ]; then
    echo -e "${GREEN}✅ Trae detected / 检测到 Trae${NC}"
    PLATFORM="trae"
elif [ "$CURSOR_FOUND" == true ]; then
    echo -e "${GREEN}✅ Cursor detected / 检测到 Cursor${NC}"
    PLATFORM="cursor"
else
    echo -e "${YELLOW}⚠️ No AI platform detected / 未检测到 AI 平台${NC}"
    echo "Please install Trae or Cursor / 请安装 Trae 或 Cursor"
    echo "  Trae: https://www.trae.ai/"
    echo "  Cursor: https://cursor.sh/"
    PLATFORM="trae"  # Default / 默认
fi

# Setup project / 设置项目
echo ""
echo "🔧 Setting up DragonStack / 设置龙栈..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Copy templates / 复制模板
echo "📄 Copying templates / 复制模板..."
# Convert platform to uppercase for template filename (兼容所有平台)
local PLATFORM_UPPER=$(echo "$PLATFORM" | tr '[:lower:]' '[:upper:]')
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
mkdir -p ./.dragonstack/logs

cat > ./.dragonstack/config.yaml << EOF
# DragonStack Configuration / 龙栈配置
platform: $PLATFORM
os: $OS
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

# OS-specific notes / 系统特定说明
echo ""
echo "📋 OS-specific notes / 系统特定说明:"
case "$OS" in
    macos)
        echo "  • Use Terminal or iTerm2 to run skills"
        echo "  • Skills location: ./.dragonstack/skills/"
        ;;
    linux)
        echo "  • Use your preferred terminal"
        echo "  • Skills location: ./.dragonstack/skills/"
        ;;
    windows)
        echo "  • Use Git Bash or WSL to run skills"
        echo "  • Skills location: ./.dragonstack/skills/"
        echo "  • Make sure to use forward slashes (/) in paths"
        ;;
    wsl)
        echo "  • WSL detected - full Linux compatibility"
        echo "  • Skills location: ./.dragonstack/skills/"
        ;;
esac

# Verify installation / 验证安装
echo ""
echo "🔍 Verifying installation / 验证安装..."

if [ -f "./DRAGONSTACK.md" ] && [ -f "./.dragonstack/config.yaml" ]; then
    echo -e "${GREEN}✅ DragonStack setup complete! / 龙栈安装完成！${NC}"
    echo ""
    echo "📚 Next steps / 下一步:"
    echo "   1. Open your AI assistant (Trae/Cursor) / 打开你的 AI 助手"
    echo "   2. Run skills from terminal: / 从终端运行技能:"
    echo "      ./.dragonstack/skills/brainstorm/brainstorm.sh"
    echo "      ./.dragonstack/skills/code-review/code-review.sh"
    echo "      ./.dragonstack/skills/ship/ship.sh"
    echo "   3. Read USAGE_GUIDE.md for details / 阅读 USAGE_GUIDE.md 了解详情"
    echo ""
    echo "🐉 Happy coding! / 编码愉快！"
else
    echo -e "${RED}❌ Setup incomplete / 安装不完整${NC}"
    exit 1
fi
