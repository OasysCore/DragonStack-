# DragonStack / 龙栈

> **A virtual engineering team for Chinese AI developers.**  
> **为中国 AI 开发者打造的虚拟工程团队。**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform: Trae](https://img.shields.io/badge/Platform-Trae-blue.svg)](https://www.trae.ai/)
[![Platform: Cursor](https://img.shields.io/badge/Platform-Cursor-green.svg)](https://cursor.sh/)

---

## 🐉 What is DragonStack? / 什么是龙栈？

**DragonStack** is an opinionated AI-powered development workflow designed for the Chinese developer ecosystem. It transforms your AI coding assistant into a virtual engineering team with structured processes, safety guardrails, and quality assurance.

**龙栈**是一套专为中国开发者生态设计的 AI 驱动开发工作流。它将你的 AI 编程助手转化为拥有结构化流程、安全防护和质量保障的虚拟工程团队。

Inspired by [gstack](https://github.com/garrytan/gstack) but rebuilt for:
- 国内网络环境 (Chinese network environment)
- 国产 AI 平台 (Domestic AI platforms)
- 中文开发者习惯 (Chinese developer workflows)

---

## 🎯 Core Philosophy / 核心理念

```
Think → Plan → Build → Review → Test → Ship → Reflect
思考 → 规划 → 构建 → 审查 → 测试 → 发布 → 复盘
```

Each skill feeds into the next. Nothing falls through the cracks.

每个技能的输出自动成为下一个技能的输入。确保没有遗漏。

---

## 🚀 Quick Start / 快速开始

### Prerequisites / 前置要求

- [Trae](https://www.trae.ai/) (Recommended / 推荐) or [Cursor](https://cursor.sh/) (Advanced / 进阶)
- Git
- Node.js 18+

### Installation / 安装

```bash
# Clone the repository
git clone https://github.com/williamzhao621/dragonstack.git ~/.dragonstack

# Run setup
cd ~/.dragonstack && ./setup.sh

# Add to your project
cp -Rf ~/.dragonstack ./.dragonstack
```

---

## 📚 Available Skills / 可用技能

### Core Skills / 核心技能

| Skill / 技能 | Description / 描述 | Command / 命令 |
|-------------|-------------------|---------------|
| **Brainstorm** / 头脑风暴 | Product ideation with 5W1H analysis | `/brainstorm` |
| **CEO Review** / CEO 审视 | Scope control and strategic alignment | `/ceo-review` |
| **Arch Design** / 架构设计 | Technical architecture and data flow | `/arch-design` |
| **Code Review** / 代码审查 | Staff Engineer-level code review | `/code-review` |
| **QA Test** / 质量测试 | Automated testing with real browser | `/qa-test` |
| **Security** / 安全审计 | OWASP + 等保 compliance audit | `/security` |
| **Ship** / 一键发布 | Test → PR → Merge in one command | `/ship` |
| **Deploy** / 部署验证 | CI/CD monitoring and verification | `/deploy` |
| **Monitor** / 线上监控 | Post-deploy monitoring | `/monitor` |
| **Retro** / 周复盘 | Weekly retrospective and metrics | `/retro` |

### Safety Skills / 安全技能

| Skill / 技能 | Description / 描述 | Command / 命令 |
|-------------|-------------------|---------------|
| **Careful** / 谨慎模式 | Warn before destructive operations | `/careful` |
| **Freeze** / 冻结模式 | Lock editing to specific directory | `/freeze` |
| **Guard** / 守护模式 | Full safety mode (Careful + Freeze) | `/guard` |

---

## 🌏 Platform Support / 平台支持

| Platform / 平台 | Status / 状态 | Notes / 说明 |
|----------------|--------------|-------------|
| **Trae** | ✅ Default / 默认 | ByteDance, Claude 3.5, Free / 免费 |
| **Cursor** | ✅ Advanced / 进阶 | Best features, requires proxy / 需代理 |
| **Codeium** | 🚧 Planned / 计划中 | Free tier, domestic / 国产可用 |
| **通义灵码** | 🚧 Planned / 计划中 | Alibaba Cloud / 阿里云 |

---

## 📖 Documentation / 文档

- [Setup Guide / 安装指南](./docs/setup.md)
- [Skill Reference / 技能参考](./docs/skills.md)
- [Platform Comparison / 平台对比](./docs/platforms.md)
- [Philosophy / 设计理念](./docs/philosophy.md)
- [Contributing / 贡献指南](./CONTRIBUTING.md)

---

## 🏗️ Architecture / 架构

```
dragonstack/
├── README.md                    # Project intro (this file)
├── README.zh.md                 # 中文版说明
├── LICENSE                      # MIT License
├── docs/                        # Documentation
│   ├── setup.md
│   ├── setup.zh.md
│   ├── skills.md
│   ├── skills.zh.md
│   ├── platforms.md
│   └── philosophy.md
├── skills/                      # Skill implementations
│   ├── brainstorm/
│   ├── ceo-review/
│   ├── arch-design/
│   ├── code-review/
│   ├── qa-test/
│   ├── security/
│   ├── ship/
│   └── ...
├── templates/                   # Project templates
│   ├── TRAE.md.template
│   ├── CURSOR.md.template
│   └── CLAUDE.md.template
├── scripts/                     # Utility scripts
│   ├── setup.sh
│   ├── upgrade.sh
│   └── verify.sh
└── examples/                    # Example projects
    ├── web-app/
    ├── api-service/
    └── cli-tool/
```

---

## 🤝 Contributing / 贡献

We welcome contributions! Please see [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines.

欢迎贡献！请查看 [CONTRIBUTING.md](./CONTRIBUTING.md) 了解贡献指南。

---

## 📜 License / 许可证

MIT License - see [LICENSE](./LICENSE) for details.

---

## 🙏 Acknowledgments / 致谢

- Inspired by [gstack](https://github.com/garrytan/gstack) by Garry Tan
- Built for the Chinese AI developer community
- Powered by [Trae](https://www.trae.ai/) and [Cursor](https://cursor.sh/)

---

<p align="center">
  <strong>DragonStack / 龙栈</strong><br>
  <em>Ship like a team of twenty. / 一人抵二十人团队。</em><br>
  <br>
  Made with ❤️ by OASYS CORE INTERNATIONAL LIMITED / 潤芯國際(香港)有限公司
</p>
