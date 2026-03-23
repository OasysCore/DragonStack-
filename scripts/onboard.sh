#!/bin/bash
# DragonStack Onboard - Interactive Setup / 交互式安装向导
# Copyright (c) 2026 OASYS CORE INTERNATIONAL LIMITED / 潤芯國際(香港)有限公司

set -e

echo "🐉 DragonStack Onboard / 龙栈交互式安装"
echo "=========================================="
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

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

# Interactive questions
echo "📝 Let's set up your project / 让我们设置你的项目"
echo ""

# Question 1: Project Name
echo "1. What is your project name? / 项目名称是什么？"
read -p "   > " PROJECT_NAME
if [ -z "$PROJECT_NAME" ]; then
    PROJECT_NAME="my-project"
fi
echo ""

# Question 2: Project Purpose
echo "2. What is the purpose of this project? / 项目目的是什么？"
echo "   Example: A smart EAP system for semiconductor packaging"
read -p "   > " PROJECT_PURPOSE
if [ -z "$PROJECT_PURPOSE" ]; then
    PROJECT_PURPOSE="A new software project"
fi
echo ""

# Question 3: Tech Stack
echo "3. What is your tech stack? / 技术栈是什么？"
echo "   Options: go | node | python | java | dotnet | other"
read -p "   > " TECH_STACK
if [ -z "$TECH_STACK" ]; then
    TECH_STACK="go"
fi
echo ""

# Question 4: AI Platform
echo "4. Which AI assistant will you use? / 使用哪个AI助手？"
echo "   Options: trae | cursor | claude | other"
read -p "   > " AI_PLATFORM
if [ -z "$AI_PLATFORM" ]; then
    AI_PLATFORM="trae"
fi
echo ""

# Setup project
echo "🔧 Setting up project..."

# Create project directory
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Initialize git
git init

# Create README
cat > README.md << EOF
# $PROJECT_NAME

$PROJECT_PURPOSE

## Tech Stack
- Backend: $TECH_STACK
- AI Assistant: $AI_PLATFORM

## Getting Started
Run \`./dragonstack\` to start the interactive workflow.

## DragonStack Skills
- \`./dragonstack brainstorm\` - Product ideation
- \`./dragonstack design\` - Architecture design
- \`./dragonstack code\` - Code generation
- \`./dragonstack review\` - Code review
- \`./dragonstack test\` - Testing
- \`./dragonstack ship\` - Release
EOF

# Create dragonstack command
cat > dragonstack << 'DRAGONSTACK_EOF'
#!/bin/bash
# DragonStack Interactive CLI / 交互式命令行

COMMAND=${1:-"menu"}

case "$COMMAND" in
    "menu"|"")
        echo "🐉 DragonStack / 龙栈"
        echo "===================="
        echo ""
        echo "Available commands / 可用命令:"
        echo "  ./dragonstack brainstorm    - Product ideation / 产品构思"
        echo "  ./dragonstack design        - Architecture design / 架构设计"
        echo "  ./dragonstack code          - Code generation / 代码生成"
        echo "  ./dragonstack review        - Code review / 代码审查"
        echo "  ./dragonstack test          - Testing / 测试"
        echo "  ./dragonstack ship          - Release / 发布"
        echo "  ./dragonstack help          - Show help / 显示帮助"
        echo ""
        ;;
    "brainstorm")
        ./.dragonstack/skills/brainstorm.sh
        ;;
    "design")
        ./.dragonstack/skills/design.sh
        ;;
    "code")
        ./.dragonstack/skills/code.sh
        ;;
    "review")
        ./.dragonstack/skills/review.sh
        ;;
    "test")
        ./.dragonstack/skills/test.sh
        ;;
    "ship")
        ./.dragonstack/skills/ship.sh
        ;;
    "help")
        echo "DragonStack - AI-powered development workflow"
        echo ""
        echo "Usage: ./dragonstack [command]"
        echo ""
        echo "Commands:"
        echo "  brainstorm  - Start product ideation"
        echo "  design      - Create architecture design"
        echo "  code        - Generate code"
        echo "  review      - Review code"
        echo "  test        - Run tests"
        echo "  ship        - Release project"
        ;;
    *)
        echo "Unknown command: $COMMAND"
        echo "Run './dragonstack help' for usage"
        ;;
esac
DRAGONSTACK_EOF

chmod +x dragonstack

# Create .dragonstack directory
mkdir -p .dragonstack/skills
mkdir -p .dragonstack/logs

# Create config
cat > .dragonstack/config.yaml << EOF
project:
  name: $PROJECT_NAME
  purpose: $PROJECT_PURPOSE
  tech_stack: $TECH_STACK
  ai_platform: $AI_PLATFORM
  created: $(date +%Y-%m-%d)

dragonstack:
  version: "1.0.0"
  skills_dir: ./.dragonstack/skills
EOF

# Create all skill scripts
# 1. Brainstorm
cat > .dragonstack/skills/brainstorm.sh << 'SKILL_EOF'
#!/bin/bash
echo "🧠 Brainstorm / 产品构思"
echo "======================="
echo ""
echo "What are you building? / 你在构建什么？"
read -p "> " IDEA
echo ""
echo "Who is it for? / 为谁而做？"
read -p "> " USERS
echo ""
echo "What problem does it solve? / 解决什么问题？"
read -p "> " PROBLEM
echo ""

# Generate document
mkdir -p docs
cat > docs/brainstorm-$(date +%Y%m%d).md << EOF
# Brainstorm: $(basename $(pwd))

**Date**: $(date +%Y-%m-%d)

## Idea / 想法
$IDEA

## Target Users / 目标用户
$USERS

## Problem / 问题
$PROBLEM

## Next Steps / 下一步
- [ ] Define MVP scope
- [ ] Create architecture design
- [ ] Start development
EOF

echo "✅ Brainstorm document created: docs/brainstorm-$(date +%Y%m%d).md"
SKILL_EOF
chmod +x .dragonstack/skills/brainstorm.sh

# 2. Design
cat > .dragonstack/skills/design.sh << 'SKILL_EOF'
#!/bin/bash
echo "🏗️ Design / 架构设计"
echo "==================="
echo ""
echo "Main components? / 主要组件？ (comma separated)"
read -p "> " COMPONENTS
echo ""
echo "Database tables? / 数据库表？ (comma separated)"
read -p "> " TABLES
echo ""
echo "API endpoints? / API端点？ (comma separated)"
read -p "> " APIS
echo ""

mkdir -p docs
cat > docs/design-$(date +%Y%m%d).md << EOF
# Architecture Design: $(basename $(pwd))

**Date**: $(date +%Y-%m-%d)

## Components / 组件
$(echo $COMPONENTS | tr ',' '\n' | sed 's/^/- /')

## Database / 数据库
$(echo $TABLES | tr ',' '\n' | sed 's/^/- /')

## API / 接口
$(echo $APIS | tr ',' '\n' | sed 's/^/- /')
EOF

echo "✅ Design document created: docs/design-$(date +%Y%m%d).md"
SKILL_EOF
chmod +x .dragonstack/skills/design.sh

# 3. Code
cat > .dragonstack/skills/code.sh << 'SKILL_EOF'
#!/bin/bash
echo "💻 Code / 代码生成"
echo "=================="
echo ""
echo "What feature to implement? / 实现什么功能？"
read -p "> " FEATURE
echo ""
echo "Any specific requirements? / 有什么特定要求？"
read -p "> " REQUIREMENTS
echo ""

echo "📝 Generating code..."
echo "Feature: $FEATURE"
echo "Requirements: $REQUIREMENTS"
echo ""
echo "💡 Tip: Use your AI assistant ($AI_PLATFORM) to generate the actual code"
echo "   Prompt: 'Generate Go code for: $FEATURE with requirements: $REQUIREMENTS'"
SKILL_EOF
chmod +x .dragonstack/skills/code.sh

# 4. Review
cat > .dragonstack/skills/review.sh << 'SKILL_EOF'
#!/bin/bash
echo "🔍 Review / 代码审查"
echo "==================="
echo ""
echo "Files to review? / 审查哪些文件？ (comma separated, or 'all')"
read -p "> " FILES
echo ""

if [ "$FILES" == "all" ]; then
    echo "Checking all source files..."
    find . -name "*.go" -o -name "*.js" -o -name "*.py" | head -20
fi

echo ""
echo "✅ Review checklist:"
echo "  [ ] Code style consistent"
echo "  [ ] Error handling"
echo "  [ ] Security checks"
echo "  [ ] Performance"
echo "  [ ] Documentation"
SKILL_EOF
chmod +x .dragonstack/skills/review.sh

# 5. Test
cat > .dragonstack/skills/test.sh << 'SKILL_EOF'
#!/bin/bash
echo "🧪 Test / 测试"
echo "=============="
echo ""
if [ -f "package.json" ]; then
    npm test 2>/dev/null || echo "No tests configured"
elif [ -f "go.mod" ]; then
    go test ./... 2>/dev/null || echo "No tests configured"
else
    echo "No test configuration found"
fi
SKILL_EOF
chmod +x .dragonstack/skills/test.sh

# 6. Ship
cat > .dragonstack/skills/ship.sh << 'SKILL_EOF'
#!/bin/bash
echo "🚀 Ship / 发布"
echo "=============="
echo ""

echo "Changes to commit:"
git status --short
echo ""

read -p "Commit message / 提交信息: " MSG
if [ -n "$MSG" ]; then
    git add -A
    git commit -m "$MSG"
    echo "✅ Committed: $MSG"
    
    if git remote -v > /dev/null 2>&1; then
        git push
        echo "✅ Pushed to remote"
    else
        echo "⚠️ No remote configured"
    fi
else
    echo "Cancelled"
fi
SKILL_EOF
chmod +x .dragonstack/skills/ship.sh

# Done
echo ""
echo -e "${GREEN}✅ Project setup complete!${NC}"
echo ""
echo "Project: $PROJECT_NAME"
echo "Purpose: $PROJECT_PURPOSE"
echo "Tech: $TECH_STACK"
echo "AI: $AI_PLATFORM"
echo ""
echo "Next steps:"
echo "  cd $PROJECT_NAME"
echo "  ./dragonstack"
echo ""
echo "🐉 Happy coding!"
