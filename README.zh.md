# 龙栈 / DragonStack

> **为中国 AI 开发者打造的虚拟工程团队。**  
> **A virtual engineering team for Chinese AI developers.**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform: Trae](https://img.shields.io/badge/平台-Trae-blue.svg)](https://www.trae.ai/)
[![Platform: Cursor](https://img.shields.io/badge/平台-Cursor-green.svg)](https://cursor.sh/)

---

## 🐉 什么是龙栈？

**龙栈**是一套专为中国开发者生态设计的 AI 驱动开发工作流。它将你的 AI 编程助手转化为拥有结构化流程、安全防护和质量保障的虚拟工程团队。

**DragonStack** is an opinionated AI-powered development workflow designed for the Chinese developer ecosystem. It transforms your AI coding assistant into a virtual engineering team with structured processes, safety guardrails, and quality assurance.

借鉴 [gstack](https://github.com/garrytan/gstack) 但专为以下场景重建：
- 国内网络环境
- 国产 AI 平台
- 中文开发者习惯

---

## 🎯 核心理念

```
思考 → 规划 → 构建 → 审查 → 测试 → 发布 → 复盘
Think → Plan → Build → Review → Test → Ship → Reflect
```

每个技能的输出自动成为下一个技能的输入。确保没有遗漏。

---

## 🚀 快速开始

### 前置要求

- [Trae](https://www.trae.ai/)（推荐）或 [Cursor](https://cursor.sh/)（进阶）
- Git
- Node.js 18+

### 安装

```bash
# 克隆仓库
git clone https://github.com/williamzhao621/dragonstack.git ~/.dragonstack

# 运行安装脚本
cd ~/.dragonstack && ./setup.sh

# 添加到项目
cp -Rf ~/.dragonstack ./.dragonstack
```

---

## 📚 可用技能

### 核心技能

| 技能 | 描述 | 命令 |
|-----|------|------|
| **头脑风暴** | 5W1H 分析进行产品构思 | `/brainstorm` |
| **CEO 审视** | 范围控制和战略对齐 | `/ceo-review` |
| **架构设计** | 技术架构和数据流设计 | `/arch-design` |
| **代码审查** | Staff Engineer 级别代码审查 | `/code-review` |
| **质量测试** | 使用真实浏览器自动化测试 | `/qa-test` |
| **安全审计** | OWASP + 等保合规审计 | `/security` |
| **一键发布** | 测试 → PR → 合并一键完成 | `/ship` |
| **部署验证** | CI/CD 监控和验证 | `/deploy` |
| **线上监控** | 部署后监控 | `/monitor` |
| **周复盘** | 每周复盘和指标统计 | `/retro` |

### 安全技能

| 技能 | 描述 | 命令 |
|-----|------|------|
| **谨慎模式** | 破坏性操作前警告 | `/careful` |
| **冻结模式** | 锁定编辑到特定目录 | `/freeze` |
| **守护模式** | 完整安全模式（谨慎+冻结） | `/guard` |

---

## 🌏 平台支持

| 平台 | 状态 | 说明 |
|-----|------|------|
| **Trae** | ✅ 默认 | 字节跳动，Claude 3.5，免费 |
| **Cursor** | ✅ 进阶 | 功能最强，需代理 |
| **Codeium** | 🚧 计划中 | 免费额度，国产可用 |
| **通义灵码** | 🚧 计划中 | 阿里云 |

---

## 📖 文档

- [安装指南](./docs/setup.zh.md)
- [技能参考](./docs/skills.zh.md)
- [平台对比](./docs/platforms.zh.md)
- [设计理念](./docs/philosophy.zh.md)
- [贡献指南](./CONTRIBUTING.zh.md)

---

## 🏗️ 架构

```
dragonstack/
├── README.md                    # 项目介绍（本文件）
├── README.zh.md                 # Chinese version
├── LICENSE                      # MIT 许可证
├── docs/                        # 文档
│   ├── setup.md / setup.zh.md
│   ├── skills.md / skills.zh.md
│   ├── platforms.md / platforms.zh.md
│   └── philosophy.md / philosophy.zh.md
├── skills/                      # 技能实现
│   ├── brainstorm/
│   ├── ceo-review/
│   ├── arch-design/
│   ├── code-review/
│   ├── qa-test/
│   ├── security/
│   ├── ship/
│   └── ...
├── templates/                   # 项目模板
│   ├── TRAE.md.template
│   ├── CURSOR.md.template
│   └── CLAUDE.md.template
├── scripts/                     # 工具脚本
│   ├── setup.sh
│   ├── upgrade.sh
│   └── verify.sh
└── examples/                    # 示例项目
    ├── web-app/
    ├── api-service/
    └── cli-tool/
```

---

## 🤝 贡献

欢迎贡献！请查看 [CONTRIBUTING.zh.md](./CONTRIBUTING.zh.md) 了解贡献指南。

---

## 📜 许可证

MIT 许可证 - 详见 [LICENSE](./LICENSE)

---

## 🙏 致谢

- 灵感来自 [gstack](https://github.com/garrytan/gstack) by Garry Tan
- 为中国 AI 开发者社区而建
- 由 [Trae](https://www.trae.ai/) 和 [Cursor](https://cursor.sh/) 提供支持

---

<p align="center">
  <strong>龙栈 / DragonStack</strong><br>
  <em>一人抵二十人团队。/ Ship like a team of twenty.</em><br>
  <br>
  Made with ❤️ by OASYS CORE INTERNATIONAL LIMITED / 潤芯國際(香港)有限公司
</p>
