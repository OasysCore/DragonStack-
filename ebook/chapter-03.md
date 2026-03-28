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

## 3.3 Code - 高质量代码生成技巧

### 什么是 Code？

Code 技能是 DragonStack 最核心的功能，将设计文档转化为**可运行的代码**。

### 使用场景

- 根据架构设计生成代码框架
- 快速实现具体功能模块
- 生成样板代码（Boilerplate）

### 使用方法

```bash
$ ds code
# 或
$ ds "code [具体需求]"
# 或使用 ACP
$ ds "code [需求] --use-acp codex"
```

### 实战案例：实现用户认证模块

**基于上一节的架构设计**：

```bash
$ ds "code 用户认证模块，包含：
  - JWT 登录/注册
  - 密码加密 (bcrypt)
  - 中间件验证
  - 错误处理
  技术栈：Node.js + Express + PostgreSQL + Prisma"
```

**生成的代码结构**：

```javascript
// src/controllers/auth.js
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();
const JWT_SECRET = process.env.JWT_SECRET;
const SALT_ROUNDS = 12;

/**
 * 用户注册
 * POST /api/auth/register
 */
async function register(req, res) {
  try {
    const { email, password, name } = req.body;
    
    // 验证输入
    if (!email || !password) {
      return res.status(400).json({
        error: 'Email and password are required'
      });
    }
    
    // 检查用户是否已存在
    const existingUser = await prisma.user.findUnique({
      where: { email }
    });
    
    if (existingUser) {
      return res.status(409).json({
        error: 'User already exists'
      });
    }
    
    // 密码加密
    const passwordHash = await bcrypt.hash(password, SALT_ROUNDS);
    
    // 创建用户
    const user = await prisma.user.create({
      data: {
        email,
        passwordHash,
        name
      },
      select: {
        id: true,
        email: true,
        name: true,
        createdAt: true
      }
    });
    
    // 生成 JWT
    const token = jwt.sign(
      { userId: user.id, email: user.email },
      JWT_SECRET,
      { expiresIn: '24h' }
    );
    
    res.status(201).json({
      token,
      user
    });
    
  } catch (error) {
    console.error('Registration error:', error);
    res.status(500).json({
      error: 'Internal server error'
    });
  }
}

/**
 * 用户登录
 * POST /api/auth/login
 */
async function login(req, res) {
  try {
    const { email, password } = req.body;
    
    // 查找用户
    const user = await prisma.user.findUnique({
      where: { email }
    });
    
    if (!user) {
      return res.status(401).json({
        error: 'Invalid credentials'
      });
    }
    
    // 验证密码
    const isValid = await bcrypt.compare(password, user.passwordHash);
    
    if (!isValid) {
      return res.status(401).json({
        error: 'Invalid credentials'
      });
    }
    
    // 生成 JWT
    const token = jwt.sign(
      { userId: user.id, email: user.email },
      JWT_SECRET,
      { expiresIn: '24h' }
    );
    
    res.json({
      token,
      user: {
        id: user.id,
        email: user.email,
        name: user.name
      }
    });
    
  } catch (error) {
    console.error('Login error:', error);
    res.status(500).json({
      error: 'Internal server error'
    });
  }
}

module.exports = {
  register,
  login
};
```

```javascript
// src/middleware/auth.js
const jwt = require('jsonwebtoken');

const JWT_SECRET = process.env.JWT_SECRET;

/**
 * JWT 验证中间件
 */
function authenticateToken(req, res, next) {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1]; // Bearer TOKEN
  
  if (!token) {
    return res.status(401).json({
      error: 'Access token required'
    });
  }
  
  jwt.verify(token, JWT_SECRET, (err, decoded) => {
    if (err) {
      return res.status(403).json({
        error: 'Invalid or expired token'
      });
    }
    
    req.userId = decoded.userId;
    req.userEmail = decoded.email;
    next();
  });
}

module.exports = {
  authenticateToken
};
```

### Code 最佳实践

#### 1. 渐进式生成

不要试图一次性生成整个项目，而是分模块进行：

```bash
# 先生成数据层
$ ds "code Prisma schema for user, document, generation models"

# 再生成服务层
$ ds "code user service with CRUD operations"

# 最后生成控制器
$ ds "code auth controller with login/register endpoints"
```

#### 2. 指定代码风格

```bash
$ ds "code with style:
  - Use TypeScript strict mode
  - Functional programming style
  - Async/await (no callbacks)
  - Comprehensive JSDoc comments"
```

#### 3. 包含测试用例

```bash
$ ds "code user authentication module with:
  - Implementation code
  - Unit tests (Jest)
  - Integration tests
  - Test coverage > 80%"
```

---

## 3.4 Review - AI 辅助代码审查

### 什么是 Review？

Review 技能帮助你在提交代码前发现潜在问题，提升代码质量。

### 使用场景

- 代码提交前的自我审查
- 学习代码审查的最佳实践
- 发现安全漏洞和性能问题

### 使用方法

```bash
$ ds review
# 或
$ ds "review [文件路径或代码]"
```

### 实战案例：审查用户认证代码

```bash
$ ds "review src/controllers/auth.js，重点关注：
  - 安全漏洞（SQL注入、XSS等）
  - 性能问题
  - 错误处理
  - 代码可读性"
```

**生成的审查报告**：

```markdown
# Code Review Report: auth.js

## 总体评分: 8.5/10

## 安全问题 🔒

### ✅ 做得好
- 使用 bcrypt 进行密码加密
- JWT Token 有过期时间
- 密码验证使用 timing-safe 比较

### ⚠️ 需要改进
1. **缺少速率限制**
   - 问题：登录接口没有防暴力破解
   - 建议：添加 express-rate-limit
   ```javascript
   const rateLimit = require('express-rate-limit');
   
   const loginLimiter = rateLimit({
     windowMs: 15 * 60 * 1000, // 15分钟
     max: 5, // 最多5次
     message: 'Too many login attempts'
   });
   
   app.use('/api/auth/login', loginLimiter);
   ```

2. **错误信息泄露**
   - 问题：注册时返回 "User already exists" 可能泄露用户信息
   - 建议：统一返回 "Registration failed"

## 性能问题 ⚡

### ⚠️ 建议优化
1. **数据库连接**
   - 当前每次请求都创建新连接
   - 建议使用连接池

2. **密码哈希成本**
   - bcrypt cost=12 可能过慢
   - 建议根据硬件调整 (10-12)

## 代码质量 📐

### ✅ 优点
- 清晰的函数命名
- 适当的注释
- 一致的代码风格

### ⚠️ 改进建议
1. **输入验证**
   - 建议使用 Joi 或 Zod 进行 Schema 验证
   
2. **日志记录**
   - 使用结构化日志（Winston/Pino）
   - 区分不同级别的日志

## 具体改进代码

```javascript
// 改进后的注册函数
async function register(req, res) {
  try {
    const { error, value } = registerSchema.validate(req.body);
    if (error) {
      return res.status(400).json({
        error: 'Invalid input',
        details: error.details
      });
    }
    
    const { email, password, name } = value;
    
    // 检查用户是否存在（不暴露具体信息）
    const existingUser = await prisma.user.findUnique({
      where: { email }
    });
    
    if (existingUser) {
      // 统一错误信息
      logger.info('Registration attempt for existing email', { email });
      return res.status(400).json({
        error: 'Registration failed'
      });
    }
    
    // ... 其余代码
    
  } catch (error) {
    logger.error('Registration error', { error: error.message });
    res.status(500).json({
      error: 'Internal server error'
    });
  }
}
```

## 行动项

- [ ] 添加速率限制中间件
- [ ] 统一错误信息
- [ ] 实现输入验证 Schema
- [ ] 添加结构化日志
```

### Review 检查清单

使用 Review 时，可以指定不同的检查维度：

```bash
# 安全审查
$ ds "review --focus=security"

# 性能审查
$ ds "review --focus=performance"

# 全面审查
$ ds "review --focus=all"
```

---

## 3.5 Test - 自动化测试策略

### 什么是 Test？

Test 技能帮助你生成测试计划和测试用例，确保代码质量。

### 使用方法

```bash
$ ds test
# 或
$ ds "test [模块名称]"
```

### 实战案例：为用户认证模块生成测试

```bash
$ ds "test 用户认证模块，包含：
  - 单元测试（Jest）
  - 集成测试（Supertest）
  - 测试覆盖率 > 80%"
```

**生成的测试代码**：

```javascript
// tests/auth.test.js
const request = require('supertest');
const app = require('../src/app');
const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();

describe('Auth API', () => {
  beforeAll(async () => {
    // 清理测试数据
    await prisma.user.deleteMany();
  });
  
  afterAll(async () => {
    await prisma.$disconnect();
  });
  
  describe('POST /api/auth/register', () => {
    it('should register a new user', async () => {
      const response = await request(app)
        .post('/api/auth/register')
        .send({
          email: 'test@example.com',
          password: 'password123',
          name: 'Test User'
        });
      
      expect(response.status).toBe(201);
      expect(response.body).toHaveProperty('token');
      expect(response.body.user).toHaveProperty('email', 'test@example.com');
    });
    
    it('should reject duplicate email', async () => {
      // 先注册一个用户
      await request(app)
        .post('/api/auth/register')
        .send({
          email: 'duplicate@example.com',
          password: 'password123'
        });
      
      // 再次注册相同邮箱
      const response = await request(app)
        .post('/api/auth/register')
        .send({
          email: 'duplicate@example.com',
          password: 'password123'
        });
      
      expect(response.status).toBe(400);
    });
    
    it('should validate input', async () => {
      const response = await request(app)
        .post('/api/auth/register')
        .send({
          email: 'invalid-email',
          password: '123' // 太短
        });
      
      expect(response.status).toBe(400);
    });
  });
  
  describe('POST /api/auth/login', () => {
    beforeEach(async () => {
      // 创建测试用户
      await request(app)
        .post('/api/auth/register')
        .send({
          email: 'login@example.com',
          password: 'password123'
        });
    });
    
    it('should login with valid credentials', async () => {
      const response = await request(app)
        .post('/api/auth/login')
        .send({
          email: 'login@example.com',
          password: 'password123'
        });
      
      expect(response.status).toBe(200);
      expect(response.body).toHaveProperty('token');
    });
    
    it('should reject invalid credentials', async () => {
      const response = await request(app)
        .post('/api/auth/login')
        .send({
          email: 'login@example.com',
          password: 'wrongpassword'
        });
      
      expect(response.status).toBe(401);
    });
  });
});
```

---

## 3.6 Ship - 发布部署自动化

### 什么是 Ship？

Ship 技能帮助你自动化发布流程，包括代码提交、版本标记、部署等。

### 使用方法

```bash
$ ds ship
```

### 功能

Ship 会执行以下操作：

1. **代码检查**
   - 运行 linter
   - 运行测试
   - 检查代码覆盖率

2. **版本管理**
   - 更新版本号
   - 生成 CHANGELOG
   - 创建 Git tag

3. **部署**
   - 构建生产版本
   - 部署到服务器
   - 健康检查

### 实战案例

```bash
$ ds ship

# 输出：
🚀 Preparing to ship...
✅ Tests passing (42/42)
✅ Linting passed
✅ Coverage: 87%
📦 Building production bundle...
✅ Build successful
🏷️  Creating tag v1.2.0...
📤 Deploying to production...
✅ Deployment successful
🎉 Ship complete! v1.2.0 is live.
```

---

## 3.7 Debug - 智能调试方法

### 什么是 Debug？

Debug 技能帮助你诊断和修复系统中的问题。

### 使用方法

```bash
$ ds debug
# 或
$ ds "debug [问题描述]"
```

### 实战案例

```bash
$ ds "debug 为什么用户登录后 Token 很快就过期"
```

**生成的调试报告**：

```markdown
# Debug Report: Token Expiration Issue

## 问题分析

### 症状
- 用户登录后 1 小时内 Token 失效
- 预期是 24 小时

### 可能原因
1. JWT 配置错误
2. 服务器时间不同步
3. 客户端缓存问题

## 诊断步骤

### 1. 检查 JWT 配置
```javascript
// 当前配置
jwt.sign(payload, secret, { expiresIn: '1h' }); // ❌ 1小时

// 应该改为
jwt.sign(payload, secret, { expiresIn: '24h' }); // ✅ 24小时
```

### 2. 检查服务器时间
```bash
date # 确保服务器时间正确
```

### 3. 检查客户端存储
```javascript
// 确保使用 localStorage 而不是 sessionStorage
localStorage.setItem('token', token);
```

## 解决方案

修改 `src/utils/jwt.js`：

```javascript
const TOKEN_EXPIRY = '24h'; // 从 1h 改为 24h

function generateToken(payload) {
  return jwt.sign(payload, JWT_SECRET, {
    expiresIn: TOKEN_EXPIRY
  });
}
```
```

---

## 3.8 Doc - 文档生成与维护

### 什么是 Doc？

Doc 技能帮助你自动生成项目文档，包括 API 文档、README 等。

### 使用方法

```bash
$ ds doc
# 或
$ ds "doc --api"      # 生成 API 文档
$ ds "doc --readme"   # 生成 README
```

---

## 3.9 Refactor - 代码重构实践

### 什么是 Refactor？

Refactor 技能帮助你改进代码结构，提升可维护性。

### 使用方法

```bash
$ ds refactor
# 或
$ ds "refactor [目标]"
```

### 实战案例

```bash
$ ds "refactor 将回调函数改为 async/await"
$ ds "refactor 提取重复代码为公共函数"
$ ds "refactor 优化数据库查询性能"
```

---

## 本章小结

### 9 个技能速查表

| 技能 | 用途 | 关键输出 |
|------|------|----------|
| Brainstorm | 产品构思 | 需求文档 |
| Design | 架构设计 | 技术方案 |
| Code | 代码生成 | 可运行代码 |
| Review | 代码审查 | 审查报告 |
| Test | 测试规划 | 测试用例 |
| Ship | 发布部署 | 上线版本 |
| Debug | 问题诊断 | 调试报告 |
| Doc | 文档生成 | 项目文档 |
| Refactor | 代码重构 | 改进代码 |

### 最佳实践

1. **按顺序使用**：Brainstorm → Design → Code → Review → Test → Ship
2. **迭代优化**：每个阶段都可以反复使用技能 refine
3. **人工审核**：AI 生成后务必人工检查
4. **文档化**：每个技能都生成文档，便于追溯

---

*第三章完成 | Completed Chapter 3*  
*编写时间: 2026-03-28*  
*字数: ~8000字 (中英文)*
