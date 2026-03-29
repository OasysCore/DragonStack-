---
name: dragonstack-assistant
description: 'AI-powered development workflow assistant with smart recommendations. Use when: (1) starting new projects, (2) choosing tech stacks, (3) need guided architecture design, (4) full-stack development with best practices. NOT for: simple file edits, one-line fixes, projects outside ~/.openclaw/workspace-work/.'
metadata:
  {
    "openclaw": { 
      "emoji": "🐉", 
      "requires": { "anyBins": ["dragonstack"] },
      "version": "3.1-2026.03.29"
    },
  }
---

# DragonStack Assistant Skill

> 智能开发工作流助手 - 告别"不清楚"，拥抱智能推荐！

## 🚀 快速开始

### 一句话创建项目
```bash
# 自然语言描述需求
openclaw dragonstack-assistant "我想做一个币安自动交易系统"

# 或者交互式
openclaw dragonstack-assistant init
```

### 智能技术栈推荐
```bash
# 获取技术栈建议
openclaw dragonstack-assistant recommend "实时聊天应用"

# 对比不同技术栈
openclaw dragonstack-assistant compare-stacks "电商网站" --options node,go,python
```

### 执行开发工作流
```bash
# 自动执行完整流程
openclaw dragonstack-assistant workflow "设计用户认证系统"

# 智能代码生成（真正生成代码，不只是提示）
openclaw dragonstack-assistant generate "自动交易模块"
```

## 💡 核心特性

### 1. 智能解析 - 一句话理解项目需求
- 自动识别项目类型（电商/博客/交易系统/...）
- 提取关键功能需求
- 分析技术复杂度

### 2. 自动架构 - 不需要回答"不清楚"
- 根据项目类型自动推荐系统架构
- 智能数据库设计
- API 端点自动生成
- 技术栈最佳实践匹配

### 3. 一键生成 - 真正可运行的代码
- 生成完整项目结构
- 包含配置文件、Docker 支持
- 可立即运行的基础代码
- 集成测试框架

### 4. 对话优化 - 随时追问调整
- 支持中途修改需求
- 智能追问澄清模糊点
- 上下文保持连贯

## 🏗️ 架构设计

```
用户输入: "我想做一个币安自动交易系统"
         ↓
┌─────────────────┐
│ 智能意图识别     │ → 识别: 量化交易系统
│ Intent Parser   │ → 复杂度: 高
└─────────────────┘
         ↓
┌─────────────────┐
│ 自动架构生成     │ → 5大模块自动推荐
│ Auto Architect  │ → 数据库设计
│                 │ → API 设计
│                 │ → 技术栈匹配
└─────────────────┘
         ↓
┌─────────────────┐
│ 代码生成引擎     │ → 生成完整项目
│ Code Generator  │ → FastAPI + SQLAlchemy
│                 │ → Docker 支持
│                 │ → 测试框架
└─────────────────┘
         ↓
┌─────────────────┐
│ MAWA 治理记录    │ → TaskRun 审计
│ MAWA Governance │ → Playbook 进化
└─────────────────┘
```

## 📝 使用示例

### 示例 1: 币安自动交易系统
```bash
$ openclaw dragonstack-assistant "我想做一个币安自动交易系统"

🐉 DragonStack Assistant
=========================

📊 项目识别: 量化交易系统 (复杂度: 高)

🧠 智能架构推荐:
  模块:
    1. 数据采集引擎 - 币安API实时行情
    2. 分析引擎 - 技术指标+舆情分析
    3. 决策系统 - 策略引擎+风险管理
    4. 执行模块 - 订单管理+仓位控制
    5. 复盘系统 - 交易分析+性能优化

💾 数据库设计:
  • InfluxDB - 时序行情数据
  • PostgreSQL - 交易记录、策略配置
  • Redis - 实时状态、缓存

🔌 API 设计 (RESTful + WebSocket):
  • GET  /api/v1/market/klines - K线数据
  • POST /api/v1/strategy - 创建策略
  • POST /api/v1/trade/order - 下单
  • WS   /ws/market - 实时行情推送

🛠️ 推荐技术栈 (Python):
  • 框架: FastAPI (异步高性能)
  • ORM: SQLAlchemy + Alembic
  • 币安SDK: python-binance
  • 数据分析: pandas, numpy, TA-Lib
  • 任务队列: Celery + Redis
  • 监控: Prometheus + Grafana

确认使用此架构？[Y/n/调整] > Y

🚀 生成项目中...
✅ 已生成:
  📁 雷电计划/
    ├── docs/
    │   ├── brainstorm-20260329.md
    │   └── design-20260329.md
    ├── src/
    │   ├── config/
    │   ├── data/
    │   ├── analysis/
    │   ├── strategy/
    │   ├── execution/
    │   ├── api/
    │   └── main.py
    ├── tests/
    ├── docker-compose.yml
    ├── requirements.txt
    └── README.md

📝 下一步:
  1. cd 雷电计划
  2. cp .env.example .env  # 配置币安API密钥
  3. docker-compose up -d
  4. ./dragonstack test
```

### 示例 2: 博客系统
```bash
$ openclaw dragonstack-assistant "个人技术博客，支持Markdown"

🐉 识别: 内容管理系统 (复杂度: 中)

推荐技术栈:
  • 前端: Next.js + Tailwind CSS
  • 后端: Next.js API Routes
  • 数据库: PostgreSQL (文章) + Redis (缓存)
  • 部署: Vercel (一键部署)

生成项目...[Y/n] > Y
✅ 完成！包含:
  • Markdown 渲染
  • 代码高亮
  • 评论系统
  • SEO 优化
  • 暗黑模式
```

## 🎯 项目类型支持

| 项目类型 | 自动识别 | 架构推荐 | 技术栈 |
|---------|---------|---------|--------|
| 电商 | ✅ | ✅ | Node/Go/Python |
| 博客/CMS | ✅ | ✅ | Next.js/Astro |
| 交易系统 | ✅ | ✅ | Python/Go |
| 社交应用 | ✅ | ✅ | Node/Go |
| 工具类 | ✅ | ✅ | 根据场景 |
| 企业后台 | ✅ | ✅ | Node/Java |

## 🔧 技术栈数据库

内置丰富的技术栈组合，根据项目特点智能匹配：

```yaml
stacks:
  high-frequency-trading:
    python:
      framework: FastAPI
      database: [InfluxDB, PostgreSQL, Redis]
      message_queue: RabbitMQ
      features: [async, low-latency]
    
  ecommerce:
    node:
      framework: Next.js
      database: PostgreSQL
      payment: Stripe
      features: [SSR, SEO]
    
  blog:
    nextjs:
      styling: Tailwind
      content: MDX
      database: PostgreSQL
      features: [SSG, fast]
```

## 📊 MAWA 集成

本 Skill 完全兼容 DragonStack MAWA 治理层：
- ✅ Registration - 技能能力边界
- ✅ Playbook - 执行策略进化
- ✅ TaskRun - 审计日志记录
- ✅ Dispatcher - 智能路由

## 🆕 版本历史

### v3.1-2026.03.29
- ✅ OpenClaw Skill 首次发布
- ✅ 智能项目初始化
- ✅ 自动架构生成
- ✅ 技术栈推荐引擎
- ✅ 一键代码生成
- ✅ 对话式交互优化

## 💰 商业模式

**OpenClaw 用户**: 免费使用全部功能
**非 OpenClaw 用户**: 
  - Web 版即将推出 (对接 VPS)
  - 付费后下载完整项目
  - 按需付费 / 订阅制

## 📜 许可证

MIT License - 与 DragonStack 保持一致

---

🐉 **DragonStack Assistant** - 让开发像对话一样简单！
