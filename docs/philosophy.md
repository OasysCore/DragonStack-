# DragonStack Philosophy / 龙栈设计理念

> The thinking behind the tools / 工具背后的思考  
> Last Updated: 2026-03-23

---

## 🎯 Core Beliefs / 核心信念

### 1. Process Over Tools / 流程胜于工具

Tools are means, not ends. A great process with simple tools beats great tools with no process.

工具是手段，不是目的。好的流程配上简单的工具，胜过没有流程的顶级工具。

**DragonStack is a process first, toolkit second.**

---

### 2. One Person, Twenty Specialists / 一人，二十专家

Modern AI enables a single developer to operate at the capacity of a full engineering team:

- **CEO** - Strategic direction / 战略方向
- **Product Manager** - Feature prioritization / 功能优先级
- **Architect** - System design / 系统设计
- **Senior Engineer** - Code quality / 代码质量
- **QA Lead** - Testing & validation / 测试验证
- **Security Officer** - Threat assessment / 威胁评估
- **DevOps** - Deployment & monitoring / 部署监控

**DragonStack provides the structure for this virtual team to function.**

---

### 3. Safety by Default / 默认安全

Destructive operations should require explicit intent:

- `/careful` - Warn before danger / 危险前警告
- `/freeze` - Limit scope / 限制范围
- `/guard` - Maximum safety / 最大安全

**Safety is not optional. It's built into every workflow.**

---

### 4. Bilingual by Design / 双语设计

DragonStack serves Chinese developers first:

- All documentation in EN + CN / 所有文档中英文
- Optimized for domestic platforms / 针对国内平台优化
- Respects Chinese network realities / 尊重中国网络现实

**Technology should serve its users' context.**

---

## 🔄 The DragonStack Loop / 龙栈循环

```
    ┌─────────────┐
    │   Think     │  /brainstorm
    │   思考      │
    └──────┬──────┘
           ↓
    ┌─────────────┐
    │    Plan     │  /ceo-review, /arch-design
    │    规划     │
    └──────┬──────┘
           ↓
    ┌─────────────┐
    │    Build    │  [implementation]
    │    构建     │
    └──────┬──────┘
           ↓
    ┌─────────────┐
    │   Review    │  /code-review
    │   审查      │
    └──────┬──────┘
           ↓
    ┌─────────────┐
    │    Test     │  /qa-test, /security
    │    测试     │
    └──────┬──────┘
           ↓
    ┌─────────────┐
    │    Ship     │  /ship, /deploy
    │    发布     │
    └──────┬──────┘
           ↓
    ┌─────────────┐
    │   Reflect   │  /retro
    │   复盘      │
    └──────┬──────┘
           ↓
    (back to Think)
```

**Each phase feeds into the next. No phase is skipped.**

---

## 🛡️ Safety Principles / 安全原则

### The Three Guards / 三守护

1. **Careful** - Question destructive actions / 质疑破坏性操作
2. **Freeze** - Limit editing scope / 限制编辑范围
3. **Guard** - Combine both for maximum safety / 结合两者获得最大安全

### When to Use Safety Mode / 何时使用安全模式

| Scenario / 场景 | Recommended Guard / 推荐守护 |
|----------------|----------------------------|
| Production hotfix / 生产热修复 | `/guard` |
| Database migration / 数据库迁移 | `/careful` |
| Refactoring / 重构 | `/freeze ./target-dir` |
| New feature / 新功能 | None (fast iteration) |
| Learning / 学习 | None (experiment freely) |

---

## 🌏 Platform Philosophy / 平台理念

### Why Trae as Default? / 为什么 Trae 作为默认？

1. **Accessibility** - Works without proxy / 无需代理
2. **Cost** - Completely free / 完全免费
3. **Capability** - Claude 3.5 is world-class / Claude 3.5 是世界级
4. **Chinese Context** - Built for Chinese developers / 为中国开发者构建

### When to Use Cursor? / 何时使用 Cursor？

1. **Advanced Features** - Need Composer mode / 需要 Composer 模式
2. **Budget Available** - $20/month acceptable / $20/月可接受
3. **Proxy Available** - Stable VPN access / 稳定 VPN 访问
4. **Maximum Productivity** - Every second counts / 每秒都很重要

---

## 📚 Learning from gstack / 从 gstack 学习

DragonStack is inspired by [gstack](https://github.com/garrytan/gstack) but differs in key ways:

| Aspect / 方面 | gstack | DragonStack |
|--------------|--------|-------------|
| **Primary Platform** | Claude Code | Trae / Cursor |
| **Target Users** | Global | Chinese developers |
| **Network** | Assumes global internet | Works behind GFW |
| **Language** | English | Bilingual (EN+CN) |
| **Cost** | Free (requires Claude) | Free (Trae is free) |

**We stand on the shoulders of giants, but build for our context.**

---

## 🎯 Success Metrics / 成功指标

How do you know DragonStack is working?

### Quantitative / 定量

- **Lines of code per day** / 每日代码行数
- **Bugs caught before production** / 生产前捕获的错误
- **Time from idea to deployment** / 从想法到部署的时间
- **Code review turnaround time** / 代码审查周转时间

### Qualitative / 定性

- **Confidence in shipping** / 发布的信心
- **Quality of architecture decisions** / 架构决策的质量
- **Team alignment** / 团队一致性
- **Developer satisfaction** / 开发者满意度

---

## 🚀 The Future / 未来

DragonStack will evolve with the AI landscape:

- **More Platforms** - Codeium, 通义灵码, etc.
- **More Skills** - Specialized tools for specific domains
- **Better Integration** - CI/CD, project management tools
- **Community Skills** - User-contributed skill library

**But the core philosophy remains: Process over tools, safety by default, humans in control.**

---

<p align="center">
  <strong>DragonStack Philosophy / 龙栈设计理念</strong><br>
  <em>Build with wisdom. Ship with confidence. / 智慧构建，信心发布。</em>
</p>
