# DragonStack 2.1 / 龙栈 2.1

> **AI-powered development workflow for Chinese developers**  
> **为中国开发者打造的 AI 驱动开发工作流**

[![Version](https://img.shields.io/badge/version-2.1-blue.svg)](https://github.com/OasysCore/DragonStack-)
[![Platform](https://img.shields.io/badge/platform-Trae%20%7C%20Cursor-green.svg)](https://www.trae.ai/)
[![ACP](https://img.shields.io/badge/ACP-Supported-orange.svg)](https://docs.openclaw.ai/tools/acp-agents)

---

## 🚀 快速开始 (30秒)

### 第一步：安装/更新龙栈

```bash
# 自动安装或更新
curl -fsSL https://raw.githubusercontent.com/OasysCore/DragonStack-/main/install.sh | bash

# 或手动运行
bash <(curl -fsSL https://raw.githubusercontent.com/OasysCore/DragonStack-/main/install.sh)
```

**已安装？** 再次运行即可更新到最新版本。

### 第二步：创建项目（交互式）

```bash
~/.dragonstack/scripts/onboard.sh
```

按照提示回答问题：
- 项目名称？
- 项目目的？
- 技术栈？
- AI 助手？

✅ 完成！项目已创建并配置好龙栈。

### 第三步：开始使用

```bash
cd your-project
./dragonstack
```

---

## 🎯 核心技能 (9个)

### 开发流程技能

| 命令 | 功能 | 用途 |
|------|------|------|
| `./dragonstack brainstorm` | 产品构思 | 开始新项目/功能 |
| `./dragonstack design` | 架构设计 | 设计技术方案 |
| `./dragonstack code` | 代码生成 | 生成代码框架 |
| `./dragonstack code-review` | 代码审查 | 检查代码质量 |
| `./dragonstack test` | 测试 | 测试规划和执行 |
| `./dragonstack ship` | 发布 | 提交并推送代码 |

### 扩展技能

| 命令 | 功能 | 用途 |
|------|------|------|
| `./dragonstack debug` | 调试 | 系统诊断和问题修复 |
| `./dragonstack doc` | 文档 | 生成 API/项目文档 |
| `./dragonstack refactor` | 重构 | 代码重构和优化 |

---

## 🤖 ACP 集成 (新功能)

DragonStack 2.1 支持 ACP (Agent Client Protocol)，可以调用外部 AI 编程工具：

```bash
# 使用 Codex 生成代码
./dragonstack code --use-acp codex --language go

# 使用 Claude 进行架构设计
./dragonstack design --use-acp claude

# 使用 Pi 进行交互式开发
./dragonstack code --use-acp pi
```

支持的 ACP 代理：
- `codex` - OpenAI Codex
- `claude` - Claude Code
- `pi` - Pi Agent
- `opencode` - OpenCode
- `gemini` - Gemini CLI
- `kimi` - Kimi Agent

---

## 📖 详细使用指南

### 完整工作流示例

```bash
# 1. 产品构思
./dragonstack brainstorm
# → 生成 docs/brainstorm-YYYYMMDD.md

# 2. 架构设计
./dragonstack design
# → 生成 docs/design-YYYYMMDD.md

# 3. 开发代码
./dragonstack code
# → 生成代码规范和模板

# 4. 代码审查
./dragonstack code-review
# → 生成审查报告

# 5. 测试规划
./dragonstack test
# → 生成测试计划和用例

# 6. 发布
./dragonstack ship
# → 提交并推送到 GitHub
```

### 扩展技能使用

```bash
# 调试问题
./dragonstack debug
# → 系统诊断框架

# 生成文档
./dragonstack doc --api
./dragonstack doc --readme
./dragonstack doc --changelog

# 重构代码
./dragonstack refactor
# → 重构计划和检查清单
```

---

## 🛠️ 系统要求

- **Git** 2.0+
- **Node.js** 18+
- **AI 助手**: Trae / Cursor / Claude / OpenClaw ACP

**支持平台**:
- ✅ macOS
- ✅ Linux
- ✅ Windows (Git Bash / WSL)

---

## 📁 项目结构

```
your-project/
├── dragonstack              # 主命令
├── README.md                # 项目说明
├── docs/                    # 生成的文档
│   ├── brainstorm-*.md
│   ├── design-*.md
│   ├── code-*.md
│   ├── test-plan-*.md
│   ├── debug-*.md
│   └── ...
├── .dragonstack/            # 龙栈配置
│   ├── config.yaml
│   └── skills/
│       ├── brainstorm/
│       ├── design/
│       ├── code/
│       ├── code-review/
│       ├── test/
│       ├── ship/
│       ├── debug/
│       ├── doc/
│       └── refactor/
└── src/                     # 你的代码
```

---

## 💡 使用技巧

### 技巧 1：快速开始新项目
```bash
~/.dragonstack/scripts/onboard.sh
```

### 技巧 2：查看所有命令
```bash
./dragonstack list
./dragonstack help
```

### 技巧 3：使用 ACP 增强开发
```bash
./dragonstack code --use-acp codex --language go --component api
```

### 技巧 4：每个技能都生成文档
所有技能都会在 `docs/` 目录生成文档，方便追踪和回顾。

### 技巧 5：与 AI 助手配合
龙栈提供结构化流程，AI 助手（Trae/Cursor/ACP）负责具体实现。

---

## 🐛 故障排除

### 问题 1：Permission denied
```bash
chmod +x ./dragonstack
chmod +x ./.dragonstack/skills/*/*.sh
```

### 问题 2：Command not found
确保你在项目根目录运行命令。

### 问题 3：Git 未配置
```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

### 问题 4：ACP 不可用
确保 OpenClaw 已安装并配置了 ACP：
```bash
openclaw config get acp.enabled
# 应该返回 true
```

---

## 🆕 更新日志

### v2.1 (2026-03-24)
- ✅ 新增 3 个扩展技能：debug, doc, refactor
- ✅ ACP 集成支持（Codex, Claude, Pi 等）
- ✅ 改进的代码生成模板
- ✅ 多语言支持（Go, Python, JavaScript, Rust）

### v2.0 (2026-03-23)
- ✅ 交互式 onboard.sh 安装向导
- ✅ 统一 dragonstack 命令入口
- ✅ 跨平台支持

---

## 🙏 致谢 / Acknowledgments

DragonStack is inspired by [gstack](https://github.com/garrytan/gstack) by Garry Tan.  
龙栈的设计灵感来源于 Garry Tan 的 gstack。

感谢开源社区提供的工具和灵感。

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
  <strong>DragonStack 2.1</strong><br>
  <em>一人抵二十人团队 / One person, twenty specialists</em><br>
  <br>
  🐉
</p>
