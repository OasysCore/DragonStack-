# DragonStack 3.0 / 龙栈 3.0

> **AI-powered development workflow with MAWA Governance**  
> **MAWA 治理的 AI 驱动开发工作流**

[![Version](https://img.shields.io/badge/version-3.0--2026.03.29-blue.svg)](https://github.com/OasysCore/DragonStack-)
[![MAWA](https://img.shields.io/badge/MAWA-Integrated-purple.svg)](https://github.com/Capsio-Michael/mawa)
[![Platform](https://img.shields.io/badge/platform-Trae%20%7C%20Cursor-green.svg)](https://www.trae.ai/)
[![ACP](https://img.shields.io/badge/ACP-Supported-orange.svg)](https://docs.openclaw.ai/tools/acp-agents)

---

## 🚀 What's New in 3.0

### MAWA Governance Layer / MAWA 治理层

DragonStack 3.0 integrates [MAWA](https://github.com/Capsio-Michael/mawa) (Managing Agent + Worker Agent) architecture:

```
┌─────────────────────────────────────────────────┐
│              MAWA Governance Layer               │
├─────────────────────────────────────────────────┤
│  📋 Registration  │  Skill capability boundaries │
│  📖 Playbook      │  Execution strategy evolution│
│  📝 TaskRun       │  Audit trail & traceability  │
│  🎯 Dispatcher    │  Intelligent routing engine  │
└─────────────────────────────────────────────────┘
                      │
┌─────────────────────────────────────────────────┐
│              9 DragonStack Skills                │
│  brainstorm → design → code → review → test →   │
│  ship + debug + doc + refactor                   │
└─────────────────────────────────────────────────┘
```

### Key Features / 核心特性

- **🎯 Natural Language Dispatch** - Just describe what you want
- **📊 Skill Evolution** - PILOT → BETA → STABLE → SOTA
- **📋 Execution Audit** - Complete traceability for every task
- **🛡️ Hard Boundaries** - Safety constraints per skill
- **🤖 ACP Integration** - Codex, Claude, Pi, Kimi support

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

## 🧠 Natural Language Mode / 自然语言模式 (New!)

DragonStack 3.0 understands natural language:

```bash
# 直接描述你的需求
./dragonstack --natural "帮我设计一个电商系统的数据库架构"

# 或者简写
./dragonstack -n "创建一个用户认证 API"

# 甚至不用指定技能
./dragonstack "我需要重构这个项目的代码结构"
```

The **Dispatcher** will automatically route to the appropriate skill!

---

## 🤖 ACP 集成

DragonStack 支持 ACP (Agent Client Protocol)，可以调用外部 AI 编程工具：

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

## 📊 MAWA 命令

### 查看系统状态
```bash
./dragonstack mawa-status
```

### 检查技能注册信息
```bash
./dragonstack mawa-inspect brainstorm
./dragonstack mawa-inspect code
```

### 查看执行历史
```bash
./dragonstack taskruns          # 最近10条
./dragonstack taskruns 20       # 最近20条
```

---

## 📖 完整工作流示例

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

### 使用自然语言完成整个流程

```bash
./dragonstack "我想创建一个博客系统，使用 Go 和 React"
# → Dispatcher 自动路由到 brainstorm → design → code
```

---

## 🛠️ 系统要求

- **Git** 2.0+
- **Node.js** 18+
- **bc** (basic calculator) - for MAWA metrics
- **AI 助手**: Trae / Cursor / Claude / OpenClaw ACP

**支持平台**:
- ✅ macOS
- ✅ Linux
- ✅ Windows (Git Bash / WSL)

---

## 📁 项目结构

```
your-project/
├── dragonstack              # 主命令 (MAWA-enabled)
├── README.md                # 项目说明
├── docs/                    # 生成的文档
│   ├── brainstorm-*.md
│   ├── design-*.md
│   ├── code-*.md
│   └── ...
├── .dragonstack/            # 龙栈配置
│   ├── config.yaml
│   └── skills/
├── mawa/                    # MAWA 治理数据 (New!)
│   ├── registry/            # 技能注册信息
│   ├── playbook/            # 执行策略
│   ├── taskrun/             # 审计日志
│   └── dispatcher/          # 路由配置
└── src/                     # 你的代码
```

---

## 💡 使用技巧

### 技巧 1：快速开始新项目
```bash
~/.dragonstack/scripts/onboard.sh
```

### 技巧 2：使用自然语言
```bash
./dragonstack --natural "帮我设计一个微服务架构"
```

### 技巧 3：查看 MAWA 状态
```bash
./dragonstack mawa-status
```

### 技巧 4：追踪执行历史
```bash
./dragonstack taskruns
```

### 技巧 5：检查技能进化状态
```bash
./dragonstack mawa-inspect code
```

---

## 🐛 故障排除

### 问题 1：Permission denied
```bash
chmod +x ./dragonstack
chmod +x ./mawa/core.sh
```

### 问题 2：MAWA not enabled
确保 `mawa/core.sh` 存在且可执行。

### 问题 3：bc command not found
```bash
# macOS
brew install bc

# Ubuntu/Debian
sudo apt-get install bc
```

### 问题 4：Git 未配置
```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

---

## 🆕 更新日志

### v3.0-2026.03.29 (2026-03-29)
- ✅ **MAWA Governance Layer** - Registration/Playbook/TaskRun/Dispatcher
- ✅ **Natural Language Dispatch** - 自然语言路由
- ✅ **Skill Evolution** - PILOT → BETA → STABLE → SOTA
- ✅ **Execution Audit Trail** - 完整执行链追踪
- ✅ **Hard Boundaries** - 技能能力边界声明
- ✅ **ATC (Agent Task Card)** - W/H/A/T 结构化任务

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

## 🏗️ MAWA 架构详解

### Registration / 技能注册

每个技能都有明确的能力边界：

```yaml
skill:
  name: code
  version: 3.0.0
  
capabilities:
  - code_generation
  - multi_language_support
  - acp_agent_integration

constraints:
  languages: go,python,javascript,typescript,rust
  requires_review: true

boundaries:
  cannot:
    - execute_destructive_commands_without_confirmation
```

### Playbook / 执行策略

技能自动进化：

```
PILOT (10次执行, 70%成功率)
   ↓
BETA (50次执行, 85%成功率)
   ↓
STABLE (100次执行, 95%成功率)
   ↓
SOTA (State of the Art)
```

### TaskRun / 审计日志

每次执行都有完整记录：

```yaml
metadata:
  taskrun_id: tr_1711699200_a1b2c3d4
  skill: code
  status: success
  
execution_chain:
  - step: dispatch
    type: decision
    timestamp: 2026-03-29T12:00:00Z
  - step: skill_invocation
    type: skill
    timestamp: 2026-03-29T12:00:01Z
```

### Dispatcher / 智能路由

自然语言解析为 ATC (Agent Task Card)：

```
Input: "帮我设计一个电商系统"

ATC:
  W (What/Why): architecture_design
  H (How): create_technical_specification
  A (Automation): partial
  T (Test): validation_required
  
→ Routed to: design skill
```

---

## 🙏 致谢 / Acknowledgments

DragonStack is inspired by:
- [gstack](https://github.com/garrytan/gstack) by Garry Tan
- [MAWA](https://github.com/Capsio-Michael/mawa) by Dr. Michael Li ([@Capsio-Michael](https://github.com/Capsio-Michael))

Special thanks to Dr. Michael Li for creating the MAWA (Managing Agent + Worker Agent) architecture, which forms the governance foundation of DragonStack 3.0.

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
  <strong>DragonStack 3.0-2026.03.29</strong><br>
  <em>MAWA Governance × AI Development / MAWA 治理 × AI 开发</em><br>
  <br>
  🐉
</p>
