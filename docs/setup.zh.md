# 安装指南 / Setup Guide

> 5 分钟内启动龙栈  
> Get DragonStack running in 5 minutes  
> Last Updated: 2026-03-23

---

## 📋 前置要求

开始前，请确保你有：

- **Git** - 版本控制
- **Node.js 18+** - JavaScript 运行时
- **Trae 或 Cursor** - AI 编程助手

### 检查系统

```bash
# 检查 Git
git --version
# 应输出: git version 2.x.x

# 检查 Node.js
node --version
# 应输出: v18.x.x 或更高

# 检查 npm
npm --version
```

---

## 🚀 安装

### 步骤 1: 克隆龙栈

```bash
# 克隆到主目录
git clone https://github.com/OasysCore/DragonStack-.git ~/.dragonstack

# 进入目录
cd ~/.dragonstack
```

### 步骤 2: 运行安装

```bash
# 使安装脚本可执行
chmod +x scripts/setup.sh

# 运行安装
./scripts/setup.sh
```

安装脚本将：
- ✅ 检查前置条件
- ✅ 检测你的 AI 平台
- ✅ 创建配置文件
- ✅ 复制模板

### 步骤 3: 添加到项目

```bash
# 导航到你的项目
cd /path/to/your/project

# 复制龙栈
cp -Rf ~/.dragonstack ./.dragonstack

# 运行项目安装
./.dragonstack/scripts/setup.sh
```

---

## ⚙️ 配置

### 平台选择

龙栈自动检测你的 AI 平台。手动配置：

```yaml
# .dragonstack/config.yaml
platform: trae  # 或: cursor, codeium

# 模型设置
model: claude-3.5-sonnet

# 安全设置
safety:
  careful_mode: true
  freeze_on_start: false

# 技能设置
skills:
  auto_update: true
  check_interval: 86400
```

### 项目特定设置

创建项目配置：

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

## 🧪 验证

### 运行验证脚本

```bash
# 从项目目录
./.dragonstack/scripts/verify.sh
```

预期输出：
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

## 🎯 第一步

### 1. 阅读文档

```bash
# 打开技能参考
open docs/skills.zh.md

# 打开平台对比
open docs/platforms.zh.md
```

### 2. 尝试第一个技能

打开你的 AI 助手并输入：

```
/brainstorm
我想为我的日历构建一个每日简报应用。
```

### 3. 探索更多技能

```
/arch-design    - 设计技术架构
/code-review    - 审查你的代码
/qa-test        - 测试你的应用
/ship           - 发布你的代码
```

---

## 🔧 故障排除

### 问题: 命令未找到

**解决方案**:
```bash
# 确保脚本可执行
chmod +x ~/.dragonstack/scripts/*.sh

# 添加到 PATH
export PATH="$HOME/.dragonstack/scripts:$PATH"
```

### 问题: 平台未检测到

**解决方案**:
```yaml
# 在配置中手动指定
# .dragonstack/config.yaml
platform: trae  # 或 cursor
```

### 问题: 技能未加载

**解决方案**:
```bash
# 重新运行安装
cd ~/.dragonstack && ./scripts/setup.sh

# 验证安装
./scripts/verify.sh
```

---

## 📚 下一步

1. **阅读设计理念**
   - 理解龙栈存在的原因
   - 学习核心原则

2. **探索技能**
   - 在测试项目中尝试每个技能
   - 理解何时使用每个技能

3. **自定义**
   - 添加自定义技能
   - 修改模板
   - 为你的工作流配置

4. **加入社区**
   - GitHub 讨论
   - 分享你的经验
   - 贡献改进

---

## 🆘 获取帮助

- **文档**: `/docs` 目录
- **Issues**: GitHub Issues
- **Discussions**: GitHub Discussions

---

<p align="center">
  <strong>欢迎来到龙栈！/ Welcome to DragonStack!</strong><br>
  <em>一人抵二十人团队。/ Ship like a team of twenty.</em>
</p>
