# 🐉 DragonStack 3.0 Beta

> **三位一体的 AI 开发工作流**  
> CLI + IDE插件 + Web界面

[![Version](https://img.shields.io/badge/version-3.0.0--beta-blue.svg)](https://github.com/OasysCore/DragonStack-)
[![Platform](https://img.shields.io/badge/platform-CLI%20%7C%20IDE%20%7C%20Web-green.svg)](https://github.com/OasysCore/DragonStack-)

---

## ✨ 3.0 Beta 新特性

### 🎯 三位一体体验

| 平台 | 使用方式 | 适合场景 |
|------|----------|----------|
| **CLI** | `ds 'brainstorm一个项目'` | 终端党、自动化脚本 |
| **IDE插件** | 点击按钮或输入 `/brainstorm` | 开发者日常编码 |
| **Web** | 浏览器访问，点击执行 | 团队协作、可视化 |

### 🗣️ 自然语言执行

```bash
# 不再需要记命令，直接说人话！
ds '帮我设计一个博客系统的架构，用 Go 语言'
ds '用 Claude 生成 Python 的 API 代码'
ds 'debug 这个内存泄漏问题'
```

### 🤖 ACP 集成

支持外部 AI 编程工具：
- ✅ OpenAI Codex
- ✅ Claude Code
- ✅ Pi Agent
- ✅ Gemini CLI
- ✅ Kimi Agent

---

## 🚀 快速开始

### 安装

```bash
# 一键安装
curl -fsSL https://raw.githubusercontent.com/OasysCore/DragonStack-/main/install.sh | bash

# 3.0 Beta 版本
export DS_VERSION=3.0-beta
bash <(curl -fsSL https://raw.githubusercontent.com/OasysCore/DragonStack-/main/install.sh)
```

### 使用

#### 方式 1：自然语言（推荐）⭐

```bash
# 直接描述你想做什么
ds 'brainstorm一个电商后台管理系统'
ds '设计系统架构，用微服务'
ds '生成Go代码实现用户认证'
```

#### 方式 2：交互式菜单

```bash
ds
# 显示 TUI 菜单，方向键选择
```

#### 方式 3：传统命令

```bash
ds brainstorm
ds design --use-acp claude
ds code --language go
```

---

## 🛠️ 9 个技能

### 核心技能 (6)

| 技能 | 命令 | 说明 |
|------|------|------|
| 🧠 Brainstorm | `ds brainstorm` | 产品构思和需求分析 |
| 🏗️ Design | `ds design` | 架构设计和技术选型 |
| 💻 Code | `ds code` | 代码生成（Go/Python/JS/Rust）|
| 🔍 Code Review | `ds code-review` | 代码质量检查 |
| 🧪 Test | `ds test` | 测试规划和覆盖率分析 |
| 🚀 Ship | `ds ship` | 发布和部署 |

### 扩展技能 (3)

| 技能 | 命令 | 说明 |
|------|------|------|
| 🐛 Debug | `ds debug` | 系统化调试诊断 |
| 📚 Doc | `ds doc` | 文档生成（API/README/Changelog）|
| 🔧 Refactor | `ds refactor` | 代码重构计划 |

---

## 🔌 IDE 插件

### Trae / Cursor

1. 安装插件
2. 侧边栏点击 🐉 DragonStack 图标
3. 选择技能或输入自然语言

快捷键：`Ctrl+Shift+D` / `Cmd+Shift+D`

### VS Code

```bash
# 安装
ext install oasys-core.dragonstack
```

---

## 🌐 Web 界面

访问：https://dragonstack.oasys.dev

功能：
- 🎨 可视化技能面板
- 💬 自然语言输入
- 📊 项目仪表盘
- 👥 团队协作

---

## 📁 项目结构

```
dragonstack-3.0-beta/
├── ds                          # 主命令（简化版）
├── core/                       # 核心模块
│   ├── api/                    # API 服务器
│   └── tui/                    # 终端界面
├── plugins/                    # IDE 插件
│   ├── trae-cursor/            # Trae/Cursor 插件
│   └── vscode/                 # VS Code 插件
├── web/                        # Web 界面
│   ├── index.html              # 主页面
│   └── app/                    # React 应用
├── docs/                       # 文档
└── README.md                   # 本文件
```

---

## 🎯 使用示例

### 完整开发流程

```bash
# 1. 构思
$ ds 'brainstorm一个社交媒体应用'
✅ 已生成 docs/brainstorm-20260324.md

# 2. 设计
$ ds '设计微服务架构，用 Go + gRPC'
✅ 已生成 docs/design-20260324.md

# 3. 开发
$ ds '生成用户服务的代码，用 Codex'
✅ 已生成 src/user/service.go

# 4. 审查
$ ds 'review用户服务代码'
✅ 已生成 docs/code-review-20260324.md

# 5. 测试
$ ds '为用户服务写单元测试'
✅ 已生成 src/user/service_test.go

# 6. 发布
$ ds ship
✅ 已提交并推送到 GitHub
```

---

## 🛣️ 路线图

### 3.0 Beta (当前)
- [x] 简化 CLI
- [x] 自然语言执行
- [x] OpenClaw Skill
- [x] 基础 TUI
- [ ] Trae/Cursor 插件
- [ ] Web 界面完整版

### 3.0 Stable
- [ ] 可视化工作流编辑器
- [ ] 团队协作功能
- [ ] 更多 AI 代理支持
- [ ] 插件市场

---

## 🤝 贡献

欢迎提交 Issue 和 PR！

GitHub: https://github.com/OasysCore/DragonStack-

---

## 📜 许可证

MIT License

Copyright (c) 2026 OASYS CORE INTERNATIONAL LIMITED / 潤芯國際(香港)有限公司

---

<p align="center">
  <strong>DragonStack 3.0 Beta</strong><br>
  <em>自然语言 · 多平台 · AI 增强</em><br>
  <br>
  🐉
</p>
