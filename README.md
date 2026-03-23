# DragonStack 2.0 / 龙栈 2.0

> **AI-powered development workflow for Chinese developers**  
> **为中国开发者打造的 AI 驱动开发工作流**

[![Version](https://img.shields.io/badge/version-2.0-blue.svg)](https://github.com/OasysCore/DragonStack-)
[![Platform](https://img.shields.io/badge/platform-Trae%20%7C%20Cursor-green.svg)](https://www.trae.ai/)

---

## 🚀 快速开始 (30秒)

### 第一步：安装龙栈

```bash
git clone https://github.com/OasysCore/DragonStack-.git ~/.dragonstack
```

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

## 🎯 核心技能

| 命令 | 功能 | 用途 |
|------|------|------|
| `./dragonstack brainstorm` | 产品构思 | 开始新项目/功能 |
| `./dragonstack design` | 架构设计 | 设计技术方案 |
| `./dragonstack code` | 代码生成 | 生成代码框架 |
| `./dragonstack review` | 代码审查 | 检查代码质量 |
| `./dragonstack test` | 测试 | 运行测试 |
| `./dragonstack ship` | 发布 | 提交并推送代码 |

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
# → 提示如何用 AI 生成代码

# 4. 代码审查
./dragonstack review
# → 检查清单和报告

# 5. 运行测试
./dragonstack test
# → 自动运行测试

# 6. 发布
./dragonstack ship
# → 提交并推送到 GitHub
```

---

## 🛠️ 系统要求

- **Git** 2.0+
- **Node.js** 18+
- **AI 助手**: Trae / Cursor / Claude

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
│   └── ...
├── .dragonstack/            # 龙栈配置
│   ├── config.yaml
│   └── skills/
│       ├── brainstorm.sh
│       ├── design.sh
│       ├── code.sh
│       ├── review.sh
│       ├── test.sh
│       └── ship.sh
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
./dragonstack help
```

### 技巧 3：每个技能都生成文档
所有技能都会在 `docs/` 目录生成文档，方便追踪和回顾。

### 技巧 4：与 AI 助手配合
龙栈提供结构化流程，AI 助手（Trae/Cursor）负责具体实现。

---

## 🐛 故障排除

### 问题 1：Permission denied
```bash
chmod +x ./dragonstack
chmod +x ./.dragonstack/skills/*.sh
```

### 问题 2：Command not found
确保你在项目根目录运行命令。

### 问题 3：Git 未配置
```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

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
  <strong>DragonStack 2.0</strong><br>
  <em>一人抵二十人团队 / One person, twenty specialists</em><br>
  <br>
  🐉
</p>
