# Example: API Service with DragonStack / 示例：使用龙栈开发 API 服务

> Building a REST API service using DragonStack / 使用龙栈构建 REST API 服务

---

## 🎯 Project Overview / 项目概述

A RESTful API service for a task management system.

任务管理系统的 RESTful API 服务。

**Tech Stack / 技术栈**:
- Runtime: Node.js + Express
- Database: PostgreSQL
- ORM: Prisma
- Auth: JWT
- Testing: Jest + Supertest
- Docs: Swagger/OpenAPI

---

## 🚀 Development Process / 开发流程

### Step 1: Brainstorm / 步骤 1：头脑风暴

```bash
/brainstorm
Build a task management API with:
- User authentication (register, login, JWT)
- CRUD operations for tasks
- Task categories and priorities
- Due dates and reminders
- API documentation
- Rate limiting

构建任务管理 API：
- 用户认证（注册、登录、JWT）
- 任务的增删改查操作
- 任务分类和优先级
- 截止日期和提醒
- API 文档
- 速率限制
```

---

### Step 2: Security Review / 步骤 2：安全审查

执行 API 安全审查：
- Authentication mechanisms / 认证机制
- Input validation / 输入验证
- SQL injection prevention / SQL 注入防护
- XSS prevention / XSS 防护
- Rate limiting / 速率限制

---

### Step 3-6: Standard Workflow / 步骤 3-6：标准工作流

[Build → Code Review → QA Test → Ship]

---

## 📁 Project Structure / 项目结构

```
task-api/
├── src/
│   ├── controllers/
│   │   ├── auth.ts
│   │   └── tasks.ts
│   ├── models/
│   │   ├── user.ts
│   │   └── task.ts
│   ├── middleware/
│   │   ├── auth.ts
│   │   ├── validation.ts
│   │   └── rateLimit.ts
│   ├── routes/
│   │   ├── auth.ts
│   │   └── tasks.ts
│   ├── utils/
│   │   └── jwt.ts
│   └── app.ts
├── prisma/
│   └── schema.prisma
├── tests/
│   ├── auth.test.ts
│   └── tasks.test.ts
├── docs/
│   └── swagger.yaml
└── package.json
```

---

## 🎯 Key Takeaways / 关键要点

1. **Security is paramount / 安全至上**
   - Security review is essential for APIs / 安全审查对 API 至关重要
   - Never skip security review / 绝不要跳过安全审查

2. **Documentation matters / 文档很重要**
   - API consumers need clear docs / API 使用者需要清晰的文档
   - Use OpenAPI/Swagger / 使用 OpenAPI/Swagger

3. **Testing is non-negotiable / 测试不可协商**
   - Unit tests for business logic / 业务逻辑的单元测试
   - Integration tests for endpoints / 端点的集成测试

---

<p align="center">
  <strong>Built with DragonStack / 使用龙栈构建</strong>
</p>
