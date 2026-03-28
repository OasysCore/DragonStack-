# 第三章: 9 个 AI 技能实战
# Chapter 3: 9 AI Skills in Practice

---

## 概述 / Overview

DragonStack 提供 9 个核心 AI 技能，覆盖软件开发的完整生命周期：

```
构思 → 设计 → 编码 → 审查 → 测试 → 发布 → 调试 → 文档 → 重构
```

本章将通过**实战案例**，详细讲解每个技能的使用方法和最佳实践。

---

## 3.1 Brainstorm - 从 0 到 1 产品构思

### 什么是 Brainstorm？

Brainstorm 技能帮助你在**项目启动阶段**快速理清思路，生成完整的产品构思文档。

### 使用场景

- 有一个模糊的想法，需要系统化梳理
- 启动新项目，需要明确目标和范围
- 规划新功能，需要分析用户需求

### 使用方法

```bash
$ ds brainstorm
# 或
$ ds "brainstorm [产品描述]"
```

### 实战案例：AI 写作助手

**需求**：你想开发一个 AI 写作助手，但思路还不清晰。

```bash
$ ds "brainstorm 一个 AI 写作助手，帮助内容创作者提高写作效率"
```

**生成的 brainstorm 文档结构**：

```markdown
# Brainstorm: AI 写作助手

## 1. 5W1H 分析

### What (是什么)
AI 驱动的写作辅助工具，提供：
- 智能续写
- 文章润色
- 标题生成
- 大纲规划

### Who (目标用户)
- 自媒体创作者
- 营销文案人员
- 学生/研究人员
- 企业内容团队

### Why (为什么需要)
- 写作效率低，灵感枯竭
- 内容质量不稳定
- 缺乏结构化思维
- 多平台适配困难

### When (使用场景)
- 日常内容创作
- 紧急稿件需求
- 多语言翻译
- SEO 优化

### Where (使用平台)
- Web 应用
- 浏览器插件
- 移动端 App
- API 接口

### How (如何实现)
技术栈：React + Node.js + OpenAI API
商业模式：Freemium（免费+付费）

## 2. 用户画像

### 用户 A：自媒体博主小李
- 年龄：28岁
- 痛点：日更压力大，经常写不出内容
- 需求：快速生成初稿，提供灵感

### 用户 B：营销经理王总
- 年龄：35岁
- 痛点：需要大量营销文案，质量参差不齐
- 需求：品牌调性一致的文案生成

## 3. 功能列表

### MVP (最小可行产品)
- [ ] 智能续写
- [ ] 文章润色
- [ ] 标题生成
- [ ] 基础模板

### Phase 2
- [ ] 大纲规划
- [ ] 多语言支持
- [ ] SEO 优化建议
- [ ] 团队协作

### Phase 3
- [ ] 自定义模型训练
- [ ] 品牌调性学习
- [ ] API 开放平台

## 4. 竞品分析

| 竞品 | 优势 | 劣势 | 差异化机会 |
|------|------|------|-----------|
| Jasper | 功能全面 | 价格贵 | 更便宜的替代 |
| Copy.ai | 易用 | 中文弱 | 中文优化 |
| 文心一言 | 免费 | 通用性强 | 垂直场景 |

## 5. 技术选型建议

- **前端**: React + TypeScript
- **后端**: Node.js + Express
- **数据库**: PostgreSQL
- **AI**: OpenAI GPT-4 / Claude
- **部署**: Vercel + Railway

## 6. 成功指标

- 日活跃用户 > 1000
- 付费转化率 > 5%
- 用户满意度 > 4.5/5
```

### Brainstorm 最佳实践

#### ✅ 好的输入

```bash
# 提供足够的上下文
$ ds "brainstorm 一个面向大学生的二手交易平台，解决校园内物品流转问题"

# 明确目标用户
$ ds "brainstorm 一个 B2B SaaS 产品，帮助中小企业自动化财务报表生成"

# 包含竞品参考
$ ds "brainstorm 一个类似 Notion 的协作工具，但专注于开发者文档管理"
```

#### ❌ 避免的输入

```bash
# 过于模糊
$ ds "brainstorm 一个社交应用"

# 过于狭窄
$ ds "brainstorm 一个红色按钮"

# 技术实现导向（这是 Design 阶段的工作）
$ ds "brainstorm 用 React 和 Go 做一个博客系统"
```

### 练习

尝试用 Brainstorm 分析以下想法：

1. 一个帮助程序员记录学习笔记的工具
2. 一个自动化社交媒体运营的系统
3. 一个智能家居控制中心

---

## 3.2 Design - 架构设计最佳实践

### 什么是 Design？

Design 技能帮助你将 Brainstorm 阶段的产品构思，转化为**可执行的技术架构设计**。

### 使用场景

- 确定了产品方向，需要技术实现方案
- 需要设计数据库模型和 API
- 需要规划系统架构和部署方案

### 使用方法

```bash
$ ds design
# 或
$ ds "design [架构需求]"
```

### 实战案例：AI 写作助手架构设计

**基于上一节的 Brainstorm 结果**：

```bash
$ ds "design AI 写作助手的技术架构，支持：
  - 智能续写（流式响应）
  - 文章润色（异步处理）
  - 标题生成（批量处理）
  - 用户认证和配额管理
  技术栈：React + Node.js + PostgreSQL + Redis"
```

**生成的 design 文档结构**：

```markdown
# Design: AI 写作助手

## 1. 系统架构

### 整体架构图

```
┌─────────────────┐
│   React SPA     │
│  (Frontend)     │
└────────┬────────┘
         │ HTTP/WS
         ▼
┌─────────────────┐
│  Node.js API    │
│   (Backend)     │
└────────┬────────┘
         │
    ┌────┴────┐
    ▼         ▼
┌────────┐ ┌────────┐
│PostgreSQL│ │ Redis  │
│ (Data)  │ │(Cache) │
└────────┘ └────────┘
    │
    ▼
┌─────────────────┐
│  OpenAI API     │
│  (AI Service)   │
└─────────────────┘
```

## 2. 数据库设计

### 用户表 (users)
```sql
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  name VARCHAR(100),
  plan VARCHAR(20) DEFAULT 'free', -- free, pro, enterprise
  quota_used INTEGER DEFAULT 0,
  quota_limit INTEGER DEFAULT 100, -- free tier
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
```

### 文档表 (documents)
```sql
CREATE TABLE documents (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id),
  title VARCHAR(255),
  content TEXT,
  status VARCHAR(20) DEFAULT 'draft', -- draft, published, archived
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
```

### 生成记录表 (generations)
```sql
CREATE TABLE generations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id),
  document_id UUID REFERENCES documents(id),
  type VARCHAR(50), -- continuation, polish, title
  prompt TEXT,
  result TEXT,
  tokens_used INTEGER,
  created_at TIMESTAMP DEFAULT NOW()
);
```

## 3. API 设计

### 认证相关

#### POST /api/auth/register
注册新用户

**Request:**
```json
{
  "email": "user@example.com",
  "password": "securepassword",
  "name": "John Doe"
}
```

**Response:**
```json
{
  "token": "jwt_token_here",
  "user": {
    "id": "uuid",
    "email": "user@example.com",
    "name": "John Doe",
    "plan": "free"
  }
}
```

#### POST /api/auth/login
用户登录

### 文档相关

#### GET /api/documents
获取文档列表

#### POST /api/documents
创建新文档

#### POST /api/generate/continuation
智能续写

**Request:**
```json
{
  "document_id": "uuid",
  "context": "前文内容...",
  "style": "professional", // professional, casual, academic
  "length": 200 // 期望字数
}
```

**Response (Stream):**
```
data: {"chunk": "生成的"}
data: {"chunk": "内容"}
data: {"done": true}
```

## 4. 核心模块设计

### 4.1 智能续写模块

**流程：**
1. 用户输入前文
2. 构建 Prompt（包含风格、长度等参数）
3. 调用 OpenAI API（流式响应）
4. 实时返回给用户
5. 保存生成记录

**关键代码结构：**
```javascript
// services/continuation.js
async function generateContinuation({ context, style, length }) {
  const prompt = buildPrompt({ context, style, length });
  
  const stream = await openai.chat.completions.create({
    model: 'gpt-4',
    messages: [{ role: 'user', content: prompt }],
    stream: true
  });
  
  return stream;
}
```

### 4.2 配额管理模块

**策略：**
- 免费用户：100 次/月
- Pro 用户：1000 次/月
- Enterprise：无限

**实现：**
```javascript
// middleware/quota.js
async function checkQuota(req, res, next) {
  const user = req.user;
  
  if (user.quota_used >= user.quota_limit) {
    return res.status(429).json({
      error: 'Quota exceeded',
      upgrade_url: '/upgrade'
    });
  }
  
  next();
}
```

## 5. 部署架构

### 开发环境
```yaml
# docker-compose.dev.yml
version: '3.8'
services:
  app:
    build: .
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=development
      - DATABASE_URL=postgresql://user:pass@db:5432/aiwriter
  db:
    image: postgres:15
    ports:
      - "5432:5432"
```

### 生产环境
- **前端**: Vercel (CDN + Edge)
- **后端**: Railway / Render
- **数据库**: Supabase PostgreSQL
- **缓存**: Upstash Redis
- **AI**: OpenAI API

## 6. 性能优化

### 数据库优化
- 为 user_id 添加索引
- 为 created_at 添加索引（分页查询）
- 定期归档旧数据

### API 优化
- 使用 Redis 缓存热点数据
- OpenAI 响应流式返回
- 实现请求合并（批量处理）

### 前端优化
- 虚拟滚动（长文档）
- Debounce 输入（减少 API 调用）
- 乐观更新（提升体验）

## 7. 安全考虑

- JWT Token 过期时间：24小时
- 密码加密：bcrypt (cost=12)
- API 限流：100次/分钟/用户
- SQL 注入防护：使用 ORM
- XSS 防护：输入过滤 + CSP
```

### Design 最佳实践

#### 分层设计原则

```
Presentation Layer (React)
    ↓
API Layer (Express)
    ↓
Service Layer (Business Logic)
    ↓
Data Layer (PostgreSQL)
```

#### 设计评审 Checklist

- [ ] 是否满足所有功能需求？
- [ ] 是否考虑了扩展性？
- [ ] 是否有单点故障？
- [ ] 性能是否满足要求？
- [ ] 安全是否考虑周全？

---

*第三章继续编写中...*  
*当前进度: 3.1 Brainstorm ✅, 3.2 Design ✅*
