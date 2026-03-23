#!/bin/bash
# DragonStack Verify Script / 龙栈验证脚本
# Copyright (c) 2026 OASYS CORE INTERNATIONAL LIMITED / 潤芯國際(香港)有限公司

set -e

echo "🐉 DragonStack Verification / 龙栈验证"
echo "======================================="
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

ERRORS=0

# Check DragonStack installation / 检查龙栈安装
echo "🔍 Checking DragonStack installation / 检查龙栈安装..."
if [ -d "${HOME}/.dragonstack" ]; then
    echo -e "${GREEN}✅ DragonStack installed / 龙栈已安装${NC}"
else
    echo -e "${RED}❌ DragonStack not installed / 龙栈未安装${NC}"
    ((ERRORS++))
fi

# Check project configuration / 检查项目配置
echo ""
echo "🔍 Checking project configuration / 检查项目配置..."
if [ -f "./DRAGONSTACK.md" ]; then
    echo -e "${GREEN}✅ DRAGONSTACK.md exists / DRAGONSTACK.md 存在${NC}"
else
    echo -e "${YELLOW}⚠️ DRAGONSTACK.md not found / DRAGONSTACK.md 未找到${NC}"
fi

if [ -f "./.dragonstack/config.yaml" ]; then
    echo -e "${GREEN}✅ config.yaml exists / config.yaml 存在${NC}"
else
    echo -e "${YELLOW}⚠️ config.yaml not found / config.yaml 未找到${NC}"
fi

# Check prerequisites / 检查前置条件
echo ""
echo "🔍 Checking prerequisites / 检查前置条件..."

if command -v git &> /dev/null; then
    echo -e "${GREEN}✅ Git installed / Git 已安装${NC}"
else
    echo -e "${RED}❌ Git not installed / Git 未安装${NC}"
    ((ERRORS++))
fi

if command -v node &> /dev/null; then
    echo -e "${GREEN}✅ Node.js installed / Node.js 已安装${NC}"
else
    echo -e "${RED}❌ Node.js not installed / Node.js 未安装${NC}"
    ((ERRORS++))
fi

# Check AI platforms / 检查 AI 平台
echo ""
echo "🔍 Checking AI platforms / 检查 AI 平台..."

if command -v trae &> /dev/null || [ -d "/Applications/Trae.app" ]; then
    echo -e "${GREEN}✅ Trae available / Trae 可用${NC}"
else
    echo -e "${YELLOW}⚠️ Trae not found / Trae 未找到${NC}"
fi

if command -v cursor &> /dev/null || [ -d "/Applications/Cursor.app" ]; then
    echo -e "${GREEN}✅ Cursor available / Cursor 可用${NC}"
else
    echo -e "${YELLOW}⚠️ Cursor not found / Cursor 未找到${NC}"
fi

# Summary / 总结
echo ""
echo "======================================="
if [ $ERRORS -eq 0 ]; then
    echo -e "${GREEN}✅ All checks passed! / 所有检查通过！${NC}"
    exit 0
else
    echo -e "${RED}❌ $ERRORS error(s) found / 发现 $ERRORS 个错误${NC}"
    exit 1
fi
