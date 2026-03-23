# 龙栈 DragonStack：为中国开发者打造的 AI 虚拟工程团队

> 一人抵二十人团队，让 AI 成为你的 CTO、架构师、QA 和发布工程师

---

## 🐉 什么是龙栈？

**龙栈 (DragonStack)** 是一套专为中国开发者生态设计的 AI 驱动开发工作流。它将你的 AI 编程助手（Trae/Cursor）转化为拥有结构化流程、安全防护和质量保障的**虚拟工程团队**。

灵感来自 YC CEO Garry Tan 的 gstack，但专为国内环境重建：
- ✅ 国内网络直连，无需代理
- ✅ 支持 Trae（免费）和 Cursor（进阶）
- ✅ 完整中文文档和示例
- ✅ MIT 协议开源

---

## 🚀 为什么需要龙栈？

### 现状：AI 编程的痛点

❌ **没有流程** - 想到哪写到哪，代码质量参差不齐  
❌ **缺乏审查** - AI 生成的代码直接提交，bug 频发  
❌ **安全隐患** - 没有安全审计，漏洞上线才被发现  
❌ **文档缺失** - 项目越来越复杂，但文档一片空白  

### 龙栈的解决方案

✅ **结构化流程** - Think → Plan → Build → Review → Test → Ship → Reflect  
✅ **自动代码审查** - Staff Engineer 级别的代码检查  
✅ **内置安全审计** - OWASP + 等保合规检查  
✅ **全程文档化** - 每个步骤自动生成文档  

---

## 🎯 核心技能一览

| 技能 | 功能 | 对应角色 |
|------|------|---------|
| `/brainstorm` | 5W1H 产品构思 | 产品经理 |
| `/ceo-review` | 战略审视和范围控制 | CEO |
| `/arch-design` | 架构设计和数据流图 | 架构师 |
| `/code-review` | 代码审查和质量把关 | Staff Engineer |
| `/qa-test` | 自动化测试和 Bug 修复 | QA 负责人 |
| `/security` | 安全审计和漏洞扫描 | 安全官 |
| `/ship` | 一键发布（测试→PR→合并）| 发布工程师 |
| `/deploy` | 部署验证和监控 | DevOps |
| `/retro` | 周复盘和数据分析 | 工程经理 |

**安全技能**：`/careful` `/freeze` `/guard` - 破坏性操作前的多重保护

---

## 📦 快速开始

```bash
# 1. 克隆龙栈
git clone https://github.com/OasysCore/DragonStack-.git ~/.dragonstack

# 2. 运行安装
cd ~/.dragonstack && ./setup.sh

# 3. 添加到项目
cp -Rf ~/.dragonstack ./.dragonstack

# 4. 开始使用！
# 在 Trae/Cursor 中输入 /brainstorm 开始你的产品构思
```

---

## 💡 使用示例：从想法到发布

### 场景：我想做一个每日简报应用

**Step 1: 头脑风暴** `/brainstorm`
```
我想为我的日历构建一个每日简报应用：
- 聚合多个日历的事件
- 显示天气和交通信息
- 提供 AI 生成的摘要
- 在可配置的时间发送通知
```
**输出**: 设计文档（5W1H 分析 + 3 种实现方案）

**Step 2: CEO 审视** `/ceo-review`
- 挑战需求范围
- 提供战略建议
- 确定 MVP 方案

**Step 3: 架构设计** `/arch-design`
- 数据流图
- API 设计
- 数据库模式
- 测试矩阵

**Step 4: 开发实现** [编写代码]

**Step 5: 代码审查** `/code-review`
- 自动修复风格问题
- 标记潜在 bug
- 安全检查

**Step 6: 质量测试** `/qa-test`
- 真实浏览器测试
- 自动修复发现的 bug
- 生成回归测试

**Step 7: 一键发布** `/ship`
- 运行测试
- 创建 PR
- 推送到 GitHub

**全程只需 8 个命令，从想法到 PR！**

---

## 🌏 平台支持

| 平台 | 状态 | 说明 |
|------|------|------|
| **Trae** | ✅ 默认推荐 | 字节跳动出品，Claude 3.5，完全免费，国内直连 |
| **Cursor** | ✅ 进阶选项 | 功能最强，$20/月，需要代理 |
| Codeium | 🚧 计划中 | 免费额度，国产可用 |
| 通义灵码 | 🚧 计划中 | 阿里云，CodeQwen |

---

## 📊 龙栈 vs gstack vs 传统开发

| 维度 | 传统开发 | gstack | 龙栈 |
|------|---------|--------|------|
| **适用平台** | 不限 | Claude Code | Trae / Cursor |
| **网络要求** | 不限 | 需代理 | 国内直连 |
| **语言支持** | 不限 | 英文 | 中英双语 |
| **成本** | 人力成本 | Claude 订阅 | Trae 免费 |
| **流程完整性** | 依赖团队 | 完整 | 完整 |

---

## 🏗️ 项目架构

```
dragonstack/
├── docs/              # 完整文档（中英双语）
├── skills/            # 技能实现
│   ├── brainstorm/    # 头脑风暴
│   ├── code-review/   # 代码审查
│   ├── ship/          # 一键发布
│   └── ...
├── examples/          # 示例项目
│   ├── web-app/       # Todo 应用示例
│   ├── cli-tool/      # CLI 工具示例
│   └── api-service/   # API 服务示例
├── templates/         # 配置模板
└── scripts/           # 工具脚本
```

---

## 🤝 贡献指南

我们欢迎所有形式的贡献：
- 🐛 提交 Bug 报告
- 💡 提出新功能建议
- 📝 改进文档
- 🔧 提交代码 PR
- 📢 分享给更多开发者

GitHub: https://github.com/OasysCore/DragonStack-

---

## 📜 许可证

MIT License - 完全免费，可商用

Copyright (c) 2026 OASYS CORE INTERNATIONAL LIMITED / 潤芯國際(香港)有限公司

---

## 🔗 相关链接

- 🐉 **GitHub**: https://github.com/OasysCore/DragonStack-
- 🌐 **Trae**: https://www.trae.ai/
- 🌐 **Cursor**: https://cursor.sh/
- 📖 **gstack (灵感来源)**: https://github.com/garrytan/gstack

---

<p align="center">
  <strong>龙栈 DragonStack</strong><br>
  <em>一人抵二十人团队。Ship like a team of twenty.</em><br>
  <br>
  Made with ❤️ by OASYS CORE INTERNATIONAL LIMITED / 潤芯國際(香港)有限公司
</p>
