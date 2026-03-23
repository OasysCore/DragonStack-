# Example: CLI Tool with DragonStack / 示例：使用龙栈开发 CLI 工具

> Building a command-line tool using DragonStack / 使用龙栈构建命令行工具

---

## 🎯 Project Overview / 项目概述

A CLI tool for generating project scaffolding with best practices built-in.

一个用于生成项目脚手架的 CLI 工具，内置最佳实践。

**Features / 功能**:
- Generate project templates / 生成项目模板
- Configure linting, testing, CI/CD / 配置代码检查、测试、CI/CD
- Initialize git repository / 初始化 git 仓库
- Install dependencies / 安装依赖

---

## 🚀 Development Process / 开发流程

### Step 1: Brainstorm / 步骤 1：头脑风暴

```bash
/brainstorm
I need a CLI tool that helps developers bootstrap new projects quickly with:
- Multiple project templates (web, api, cli, library)
- Automatic configuration of tools (eslint, prettier, jest, etc.)
- Git initialization with proper .gitignore
- Dependency installation
- Interactive prompts for customization

我需要一个 CLI 工具，帮助开发者快速启动新项目：
- 多种项目模板（Web、API、CLI、库）
- 自动配置工具（eslint、prettier、jest 等）
- 使用正确的 .gitignore 初始化 Git
- 安装依赖
- 交互式提示进行自定义
```

---

### Step 2: Architecture Design / 步骤 2：架构设计

```bash
/arch-design
Design the CLI architecture with:
- Command structure / 命令结构
- Plugin system / 插件系统
- Template management / 模板管理
- Configuration handling / 配置处理
```

---

### Step 3-6: Build, Review, Test, Ship / 步骤 3-6：构建、审查、测试、发布

[Follow standard DragonStack workflow / 遵循标准龙栈工作流]

---

## 📁 Project Structure / 项目结构

```
dragonstack-cli/
├── bin/
│   └── dragonstack.js
├── src/
│   ├── commands/
│   │   ├── init.ts
│   │   ├── generate.ts
│   │   └── list.ts
│   ├── templates/
│   │   ├── web-app/
│   │   ├── api-service/
│   │   ├── cli-tool/
│   │   └── library/
│   └── utils/
│       ├── file.ts
│       └── git.ts
├── package.json
└── README.md
```

---

## 🎯 Key Takeaways / 关键要点

1. **CLI tools benefit from DragonStack too / CLI 工具也能从龙栈受益**
   - Same structured process / 相同的结构化流程
   - Focus on different aspects (UX, error handling) / 关注不同方面（用户体验、错误处理）

2. **Testing is critical / 测试至关重要**
   - Test in multiple environments / 在多个环境中测试
   - Verify all edge cases / 验证所有边界情况

---

<p align="center">
  <strong>Built with DragonStack / 使用龙栈构建</strong>
</p>
