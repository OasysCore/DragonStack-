# DragonStack Skills Reference / 龙栈技能参考

> Complete guide to all DragonStack skills / 所有龙栈技能的完整指南  
> Version 1.0 | Last Updated: 2026-03-23

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

### `/ceo-review` - CEO Review / CEO 审视

**Purpose / 目的**: Strategic alignment and scope control / 战略对齐和范围控制

**When to use / 何时使用**:
- Before major features / 重大功能前
- Scope creep concerns / 范围蔓延担忧
- Resource allocation decisions / 资源分配决策

**Modes / 模式**:
1. **Expansion** / 扩展 - Increase scope for bigger impact
2. **Selective Expansion** / 选择性扩展 - Expand specific areas
3. **Hold Scope** / 保持范围 - Maintain current scope
4. **Reduction** / 缩减 - Reduce scope for faster shipping

**Output / 输出**: Approved scope document / 已批准的范围文档

---

### `/arch-design` - Architecture Design / 架构设计

**Purpose / 目的**: Technical architecture and data flow design / 技术架构和数据流设计

**When to use / 何时使用**:
- New system design / 新系统设计
- Major refactoring / 重大重构
- Integration planning / 集成规划

**Deliverables / 交付物**:
- Data flow diagrams / 数据流图
- API specifications / API 规范
- State machines / 状态机
- Error handling strategy / 错误处理策略
- Test matrix / 测试矩阵

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

### `/qa-test` - QA Test / 质量测试

**Purpose / 目的**: Automated testing with real browser / 使用真实浏览器自动化测试

**When to use / 何时使用**:
- Before release / 发布前
- Bug verification / 错误验证
- Regression testing / 回归测试

**Capabilities / 能力**:
- Real browser automation / 真实浏览器自动化
- Screenshot comparison / 截图对比
- Flow validation / 流程验证
- Bug auto-fix / 错误自动修复

**Output / 输出**:
- Test report / 测试报告
- Regression tests / 回归测试
- Bug fixes (if enabled) / 错误修复（如果启用）

---

### `/security` - Security Audit / 安全审计

**Purpose / 目的**: OWASP + 等保 compliance audit / OWASP + 等保合规审计

**When to use / 何时使用**:
- Before production / 生产环境前
- Quarterly audits / 季度审计
- After major changes / 重大变更后

**Standards / 标准**:
- OWASP Top 10 / OWASP 十大漏洞
- 等保 2.0 Level 3 / 等保 2.0 三级
- STRIDE threat model / STRIDE 威胁模型

**Output / 输出**:
- Security report / 安全报告
- Risk ratings / 风险评级
- Remediation plan / 修复计划

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

### `/deploy` - Deploy / 部署验证

**Purpose / 目的**: CI/CD monitoring and verification / CI/CD 监控和验证

**When to use / 何时使用**:
- After PR merge / PR 合并后
- Production deployment / 生产环境部署
- Rollback verification / 回滚验证

**Process / 流程**:
1. Wait for CI / 等待 CI
2. Monitor deploy / 监控部署
3. Verify health checks / 验证健康检查
4. Confirm production ready / 确认生产就绪

---

### `/monitor` - Monitor / 线上监控

**Purpose / 目的**: Post-deploy monitoring / 部署后监控

**When to use / 何时使用**:
- After deployment / 部署后
- Incident response / 事件响应
- Performance tracking / 性能追踪

**Metrics / 指标**:
- Error rates / 错误率
- Response times / 响应时间
- Resource usage / 资源使用
- User impact / 用户影响

---

### `/retro` - Retro / 周复盘

**Purpose / 目的**: Weekly retrospective and metrics / 每周复盘和指标统计

**When to use / 何时使用**:
- End of week / 周末
- Sprint review / 迭代回顾
- Team sync / 团队同步

**Metrics / 指标**:
- Lines of code / 代码行数
- Commits / 提交数
- Tests added / 新增测试
- Bugs fixed / 修复错误
- Shipping streak / 连续发布天数

---

## 🛡️ Safety Skills / 安全技能

### `/careful` - Careful Mode / 谨慎模式

**Purpose / 目的**: Warn before destructive operations / 破坏性操作前警告

**Triggers / 触发**:
- `rm -rf` / 删除文件
- `DROP TABLE` / 删除表
- `git push --force` / 强制推送
- Database migrations / 数据库迁移

**Usage / 使用**:
```
/careful
# Then proceed with operations
```

---

### `/freeze` - Freeze Mode / 冻结模式

**Purpose / 目的**: Lock editing to specific directory / 锁定编辑到特定目录

**Usage / 使用**:
```
/freeze ./src/components
# Only edits within ./src/components allowed
```

---

### `/guard` - Guard Mode / 守护模式

**Purpose / 目的**: Full safety mode (Careful + Freeze) / 完整安全模式（谨慎+冻结）

**Usage / 使用**:
```
/guard ./critical-code
# Maximum safety for production work
```

---

## 📝 Skill Usage Patterns / 技能使用模式

### Pattern 1: New Feature Development / 新功能开发

```
/brainstorm        → Design document
/ceo-review        → Scope approval
/arch-design       → Technical spec
[implement code]
/code-review       → Code validation
/qa-test           → Testing
/ship              → Release PR
```

### Pattern 2: Bug Fix / 错误修复

```
/investigate       → Root cause analysis
[fix code]
/code-review       → Fix validation
/qa-test           → Regression test
/ship              → Hotfix PR
```

### Pattern 3: Security Patch / 安全补丁

```
/guard             → Safety mode on
/security          → Vulnerability scan
[fix vulnerabilities]
/code-review       → Security review
/qa-test           → Testing
/ship              → Security PR
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
