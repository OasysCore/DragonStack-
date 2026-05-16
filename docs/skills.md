# DragonStack Skills Reference / 龙栈技能参考

> Complete guide to all DragonStack skills / 所有龙栈技能的完整指南  
> Version 3.0 | Last Updated: 2026-05-16

---

## 🎯 Core Skills / 核心技能

### `/brainstorm` - Brainstorm / 头脑风暴

**Purpose / 目的**: Product ideation with structured analysis / 结构化产品构思

**When to use / 何时使用**:
- Starting a new project / 开始新项目
- Exploring feature ideas / 探索功能想法
- Reframing problems / 重新定义问题

**Process / 流程**:
1. 5W1H Analysis / 5W1H 分析
2. Problem reframing / 问题重构
3. Solution alternatives / 解决方案替代方案
4. Effort estimation / 工作量估算

**Output / 输出**: Design document (feeds into downstream skills) / 设计文档（输入到下游技能）

---

### `/code-review` - Code Review / 代码审查

**Purpose / 目的**: Staff Engineer-level code review / Staff Engineer 级别代码审查

**When to use / 何时使用**:
- Before merging PRs / 合并 PR 前
- Refactoring validation / 重构验证
- Security audit / 安全审计

**Checks / 检查项**:
- Logic correctness / 逻辑正确性
- Edge cases / 边界情况
- Performance bottlenecks / 性能瓶颈
- Security vulnerabilities / 安全漏洞
- Code style / 代码风格

**Auto-fixes / 自动修复**:
- Style issues / 风格问题
- Simple bugs / 简单错误
- Documentation gaps / 文档缺失

---

### `/ship` - Ship / 一键发布

**Purpose / 目的**: Test → PR → Merge in one command / 测试 → PR → 合并一键完成

**When to use / 何时使用**:
- Feature complete / 功能完成
- Bug fix ready / 错误修复就绪
- Hotfix deployment / 热修复部署

**Process / 流程**:
1. Sync with main / 同步主分支
2. Run tests / 运行测试
3. Audit coverage / 审计覆盖率
4. Create PR / 创建 PR
5. Push to remote / 推送到远程

**Output / 输出**:
- Pull request URL / PR 链接
- Test results / 测试结果
- Coverage report / 覆盖率报告

---

## 🛡️ Safety Skills / 安全技能

### `/careful` - Careful Mode / 谨慎模式

**Purpose / 目的**: Warn before destructive operations / 破坏性操作前警告

**Triggers / 触发**:
- `rm -rf` / 删除文件
- `DROP TABLE` / 删除表
- `git push --force` / 强制推送
- Database migrations / 数据库迁移

---

### `/freeze` - Freeze Mode / 冻结模式

**Purpose / 目的**: Lock editing to specific directory / 锁定编辑到特定目录

---

### `/guard` - Guard Mode / 守护模式

**Purpose / 目的**: Full safety mode (Careful + Freeze) / 完整安全模式（谨慎+冻结）

---

## 📝 Skill Usage Patterns / 技能使用模式

### Pattern 1: New Feature / 新功能
```
/brainstorm     → Design document
[implement code]
/code-review    → Code validation
/ship           → Release PR
```

### Pattern 2: Bug Fix / 错误修复
```
/brainstorm     → Root cause analysis
[fix code]
/code-review    → Fix validation
/ship           → Hotfix PR
```

---

## 🔧 Customization / 自定义

### Adding Custom Skills / 添加自定义技能

1. Create skill directory / 创建技能目录:
   ```
   skills/my-skill/
   ├── SKILL.md
   └── script.js
   ```

2. Define skill manifest / 定义技能清单:
   ```yaml
   name: my-skill
   command: /my-skill
   description: "My custom skill"
   ```

3. Register in config / 在配置中注册:
   ```yaml
   skills:
     custom:
       - my-skill
   ```

---

<p align="center">
  <strong>DragonStack Skills / 龙栈技能</strong><br>
  <em>Master your craft. / 精通你的技艺。</em>
</p>
