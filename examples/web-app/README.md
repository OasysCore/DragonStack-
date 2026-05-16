# Example: Todo App with DragonStack / 示例：使用龙栈开发 Todo 应用

> A complete example of using DragonStack to build a web application / 使用龙栈构建 Web 应用的完整示例

---

## 🎯 Project Overview / 项目概述

This example demonstrates how to use DragonStack skills to build a simple Todo application from scratch.

本示例演示如何使用龙栈技能从零开始构建一个简单的 Todo 应用。

**Tech Stack / 技术栈**:
- Frontend: React + TypeScript
- Backend: Node.js + Express
- Database: SQLite
- Styling: Tailwind CSS

---

## 🚀 Development Process / 开发流程

### Step 1: Brainstorm / 步骤 1：头脑风暴

```bash
/brainstorm
I want to build a Todo app with the following features:
- Add, edit, delete tasks
- Mark tasks as complete
- Filter by status (all/active/completed)
- Persist data in database
- Clean, modern UI

我想构建一个 Todo 应用，包含以下功能：
- 添加、编辑、删除任务
- 标记任务完成
- 按状态筛选（全部/进行中/已完成）
- 数据持久化到数据库
- 简洁现代的界面
```

**Output / 输出**: `docs/brainstorm-output.md`

---

### Step 2: Architecture Design / 步骤 2：架构设计

基于头脑风暴输出设计 Todo 应用的技术架构：
- Data flow diagram / 数据流图
- API endpoints / API 端点
- Database schema / 数据库模式
- Component structure / 组件结构

**Output / 输出**: `docs/architecture.md`

---

### Step 3: Implementation / 步骤 3：实现

[Developer implements the code based on architecture / 开发者根据架构实现代码]

---

### Step 4: Code Review / 步骤 4：代码审查

```bash
/code-review
Review the Todo app implementation for:
- Code quality / 代码质量
- Security issues / 安全问题
- Performance bottlenecks / 性能瓶颈
- Best practices / 最佳实践
```

**Output / 输出**: Review report with suggestions / 审查报告及建议

---

### Step 5: Testing / 步骤 5：测试

手动或自动化测试 Todo 应用功能：
- Add task / 添加任务
- Edit task / 编辑任务
- Delete task / 删除任务
- Mark complete / 标记完成
- Filter tasks / 筛选任务

**Output / 输出**: Test report with any bugs found / 测试报告及发现的错误

---

### Step 6: Ship / 步骤 6：发布

```bash
/ship
Create PR with all changes and tests.
创建包含所有更改和测试的 PR。
```

**Output / 输出**: Pull request URL / PR 链接

---

## 📁 Project Structure / 项目结构

```
todo-app/
├── README.md
├── package.json
├── tsconfig.json
├── tailwind.config.js
├── src/
│   ├── components/
│   │   ├── TodoList.tsx
│   │   ├── TodoItem.tsx
│   │   └── AddTodo.tsx
│   ├── hooks/
│   │   └── useTodos.ts
│   ├── api/
│   │   └── todos.ts
│   ├── types/
│   │   └── todo.ts
│   └── App.tsx
├── server/
│   ├── index.ts
│   ├── routes/
│   │   └── todos.ts
│   └── db/
│       └── index.ts
└── docs/
    ├── brainstorm-output.md
    └── architecture.md
```

---

## 🛠️ Running the App / 运行应用

```bash
# Install dependencies / 安装依赖
npm install

# Start development server / 启动开发服务器
npm run dev

# Run tests / 运行测试
npm test

# Build for production / 构建生产版本
npm run build
```

---

## 📚 What We Learned / 我们学到了什么

### DragonStack Benefits / 龙栈优势

1. **Structured Process / 结构化流程**
   - Clear steps from idea to deployment / 从想法到部署的清晰步骤
   - No skipped phases / 没有跳过的阶段

2. **Quality Assurance / 质量保证**
   - Code review catches issues early / 代码审查及早发现问题
   - QA testing validates functionality / QA 测试验证功能

3. **Documentation / 文档**
   - Each step produces documentation / 每个步骤都产生文档
   - Easy to onboard new developers / 易于新开发者上手

### Challenges / 挑战

1. **Learning Curve / 学习曲线**
   - Remembering all skill commands / 记住所有技能命令
   - Understanding when to use each / 理解何时使用每个技能

2. **Overhead for Small Projects / 小项目的开销**
   - Full process may be too heavy for simple apps / 完整流程可能对简单应用太重
   - Can skip non-critical steps / 可以跳过非关键步骤

---

## 🎯 Next Steps / 下一步

- [ ] Add user authentication / 添加用户认证
- [ ] Add due dates for tasks / 添加任务截止日期
- [ ] Add categories/tags / 添加分类/标签
- [ ] Deploy to production / 部署到生产环境

---

<p align="center">
  <strong>Built with DragonStack / 使用龙栈构建</strong><br>
  <em>Ship like a team of twenty. / 一人抵二十人团队。</em>
</p>
