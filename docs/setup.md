# Setup Guide / 安装指南

> Get DragonStack running in 5 minutes / 5 分钟内启动龙栈  
> Last Updated: 2026-03-23

---

## 📋 Prerequisites / 前置要求

Before you begin, ensure you have: / 开始前，请确保你有：

- **Git** - Version control / 版本控制
- **Node.js 18+** - JavaScript runtime / JavaScript 运行时
- **Trae or Cursor** - AI coding assistant / AI 编程助手

### Check Your System / 检查系统

```bash
# Check Git / 检查 Git
git --version
# Should output / 应输出: git version 2.x.x

# Check Node.js / 检查 Node.js
node --version
# Should output / 应输出: v18.x.x or higher / 或更高

# Check npm / 检查 npm
npm --version
```

---

## 🚀 Installation / 安装

### Step 1: Clone DragonStack / 克隆龙栈

```bash
# Clone to home directory / 克隆到主目录
git clone https://github.com/OasysCore/DragonStack-.git ~/.dragonstack

# Enter directory / 进入目录
cd ~/.dragonstack
```

### Step 2: Run Setup / 运行安装

```bash
# Make setup script executable / 使安装脚本可执行
chmod +x scripts/setup.sh

# Run setup / 运行安装
./scripts/setup.sh
```

The setup script will: / 安装脚本将：
- ✅ Check prerequisites / 检查前置条件
- ✅ Detect your AI platform / 检测你的 AI 平台
- ✅ Create configuration files / 创建配置文件
- ✅ Copy templates / 复制模板

### Step 3: Add to Your Project / 添加到项目

```bash
# Navigate to your project / 导航到你的项目
cd /path/to/your/project

# Copy DragonStack / 复制龙栈
cp -Rf ~/.dragonstack ./.dragonstack

# Run project setup / 运行项目安装
./.dragonstack/scripts/setup.sh
```

---

## ⚙️ Configuration / 配置

### Platform Selection / 平台选择

DragonStack auto-detects your AI platform. To manually configure: / 龙栈自动检测你的 AI 平台。手动配置：

```yaml
# .dragonstack/config.yaml
platform: trae  # or / 或: cursor, codeium

# Model settings / 模型设置
model: claude-3.5-sonnet

# Safety settings / 安全设置
safety:
  careful_mode: true
  freeze_on_start: false

# Skill settings / 技能设置
skills:
  auto_update: true
  check_interval: 86400
```

### Project-Specific Settings / 项目特定设置

Create a project configuration: / 创建项目配置：

```yaml
# ./.dragonstack/config.yaml
project:
  name: my-awesome-project
  type: web-app  # web-app, api-service, cli-tool
  
linting:
  enabled: true
  rules: strict

testing:
  coverage_threshold: 70
  
deployment:
  platform: vercel  # vercel, netlify, aws, etc.
  auto_deploy: false
```

---

## 🧪 Verification / 验证

### Run Verification Script / 运行验证脚本

```bash
# From your project directory / 从项目目录
./.dragonstack/scripts/verify.sh
```

Expected output: / 预期输出：
```
🐉 DragonStack Verification / 龙栈验证
=======================================

🔍 Checking DragonStack installation / 检查龙栈安装...
✅ DragonStack installed / 龙栈已安装

🔍 Checking project configuration / 检查项目配置...
✅ DRAGONSTACK.md exists / DRAGONSTACK.md 存在
✅ config.yaml exists / config.yaml 存在

🔍 Checking prerequisites / 检查前置条件...
✅ Git installed / Git 已安装
✅ Node.js installed / Node.js 已安装

🔍 Checking AI platforms / 检查 AI 平台...
✅ Trae available / Trae 可用

=======================================
✅ All checks passed! / 所有检查通过！
```

---

## 🎯 First Steps / 第一步

### 1. Read the Documentation / 阅读文档

```bash
# Open skills reference / 打开技能参考
open docs/skills.md

# Open platform comparison / 打开平台对比
open docs/platforms.md
```

### 2. Try Your First Skill / 尝试第一个技能

Open your AI assistant and type: / 打开你的 AI 助手并输入：

```
/brainstorm
I want to build a daily briefing app for my calendar.
我想为我的日历构建一个每日简报应用。
```

### 3. Explore More Skills / 探索更多技能

```
/arch-design    - Design technical architecture / 设计技术架构
/code-review    - Review your code / 审查你的代码
/qa-test        - Test your application / 测试你的应用
/ship           - Ship your code / 发布你的代码
```

---

## 🔧 Troubleshooting / 故障排除

### Issue: Command not found / 命令未找到

**Solution / 解决方案**:
```bash
# Ensure scripts are executable / 确保脚本可执行
chmod +x ~/.dragonstack/scripts/*.sh

# Add to PATH / 添加到 PATH
export PATH="$HOME/.dragonstack/scripts:$PATH"
```

### Issue: Platform not detected / 平台未检测到

**Solution / 解决方案**:
```yaml
# Manually specify in config / 在配置中手动指定
# .dragonstack/config.yaml
platform: trae  # or cursor
```

### Issue: Skills not loading / 技能未加载

**Solution / 解决方案**:
```bash
# Re-run setup / 重新运行安装
cd ~/.dragonstack && ./scripts/setup.sh

# Verify installation / 验证安装
./scripts/verify.sh
```

---

## 📚 Next Steps / 下一步

1. **Read the Philosophy** / 阅读设计理念
   - Understand why DragonStack exists / 理解龙栈存在的原因
   - Learn the core principles / 学习核心原则

2. **Explore Skills** / 探索技能
   - Try each skill in a test project / 在测试项目中尝试每个技能
   - Understand when to use each / 理解何时使用每个技能

3. **Customize** / 自定义
   - Add custom skills / 添加自定义技能
   - Modify templates / 修改模板
   - Configure for your workflow / 为你的工作流配置

4. **Join the Community** / 加入社区
   - GitHub Discussions / GitHub 讨论
   - Share your experience / 分享你的经验
   - Contribute improvements / 贡献改进

---

## 🆘 Getting Help / 获取帮助

- **Documentation**: `/docs` directory / `/docs` 目录
- **Issues**: GitHub Issues / GitHub Issues
- **Discussions**: GitHub Discussions / GitHub Discussions

---

<p align="center">
  <strong>Welcome to DragonStack! / 欢迎来到龙栈！</strong><br>
  <em>Ship like a team of twenty. / 一人抵二十人团队。</em>
</p>
