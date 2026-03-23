# Brainstorm Skill / 头脑风暴技能

> Product ideation with structured analysis / 结构化产品构思

---

## 🎯 Purpose / 目的

The `/brainstorm` skill helps you explore and define your product idea before writing any code. It uses a structured 5W1H framework to ensure you've thought through all aspects of your project.

`/brainstorm` 技能帮助你在编写任何代码之前探索和定义你的产品想法。它使用结构化的 5W1H 框架确保你已经考虑了项目的所有方面。

---

## 🚀 Usage / 使用

```
/brainstorm
[Describe your product idea]

Example:
I want to build a daily briefing app that:
- Aggregates calendar events from multiple sources
- Shows weather and traffic information
- Provides AI-generated summaries
- Sends notifications at configurable times
```

---

## 📝 Process / 流程

### Step 1: 5W1H Analysis / 5W1H 分析

| Question / 问题 | Purpose / 目的 |
|----------------|---------------|
| **What** / 什么 | What are you building? / 你在构建什么？ |
| **Why** / 为什么 | Why does this matter? / 为什么这很重要？ |
| **Who** / 谁 | Who is it for? / 为谁而做？ |
| **When** / 何时 | When will it be used? / 何时使用？ |
| **Where** / 何地 | Where will it run? / 在哪里运行？ |
| **How** / 如何 | How will it work? / 如何工作？ |

### Step 2: Problem Reframing / 问题重构

The skill challenges your initial framing:
- "You said X, but what you actually described is Y"
- "Have you considered Z as an alternative?"
- "What if the real problem is...?"

技能会挑战你最初的框架：
- "你说的是 X，但你实际描述的是 Y"
- "你有没有考虑过 Z 作为替代方案？"
- "如果真正的问题是...呢？"

### Step 3: Solution Alternatives / 解决方案替代方案

Generates 3 different approaches:
1. **MVP** - Minimum viable product (1 week) / 最小可行产品（1周）
2. **Standard** - Full-featured version (1 month) / 完整功能版本（1月）
3. **Vision** - Complete vision (3 months) / 完整愿景（3月）

### Step 4: Effort Estimation / 工作量估算

| Approach / 方案 | Time / 时间 | Complexity / 复杂度 |
|----------------|------------|-------------------|
| MVP | 1 week | Low / 低 |
| Standard | 1 month | Medium / 中 |
| Vision | 3 months | High / 高 |

---

## 📤 Output / 输出

The skill generates a design document: / 技能生成设计文档：

```markdown
# Design Document: [Project Name]

## 1. Problem Statement / 问题陈述
...

## 2. 5W1H Analysis / 5W1H 分析
...

## 3. Solution Alternatives / 解决方案替代方案
...

## 4. Recommendation / 建议
...

## 5. Next Steps / 下一步
...
```

**Output location / 输出位置**: `docs/brainstorm-output.md`

---

## 💡 Tips / 技巧

1. **Be specific / 具体**
   - Bad: "I want to build a social app" / 不好："我想构建一个社交应用"
   - Good: "I want to build an app for book lovers to share reviews" / 好："我想构建一个供书籍爱好者分享评论的应用"

2. **Describe pain points / 描述痛点**
   - What problem are you solving? / 你在解决什么问题？
   - Who has this problem? / 谁有这个问题？

3. **Don't worry about implementation / 不要担心实现**
   - Focus on the "what" and "why" / 专注于"什么"和"为什么"
   - Leave "how" for later / 把"如何"留到以后

---

## 🔗 Next Skills / 下一步技能

After `/brainstorm`, continue with: / 使用 `/brainstorm` 后，继续使用：

1. `/ceo-review` - Strategic alignment / 战略对齐
2. `/arch-design` - Technical architecture / 技术架构
3. `/design-consultation` - UI/UX design / UI/UX 设计

---

## 📚 Example / 示例

### Input / 输入

```
/brainstorm
I want to build a daily briefing app for my calendar.
Multiple Google calendars, events with stale info, wrong locations.
Prep takes forever and the results aren't good enough.
```

### Output / 输出

```markdown
# Design Document: Daily Briefing App

## 1. Problem Statement
Users struggle to prepare for their day because calendar information
is scattered, outdated, and requires manual checking of multiple sources.

## 2. 5W1H Analysis
- **What**: A daily briefing that aggregates calendar, weather, and traffic
- **Why**: Save time and reduce stress from information overload
- **Who**: Busy professionals with multiple calendars
- **When**: Every morning, configurable time
- **Where**: Mobile app + web dashboard
- **How**: AI aggregation + smart notifications

## 3. Solution Alternatives
### MVP (1 week)
- Single calendar integration
- Basic daily email
- Static content

### Standard (1 month)
- Multiple calendar support
- Weather + traffic integration
- Mobile app
- Push notifications

### Vision (3 months)
- AI-generated insights
- Predictive scheduling
- Team coordination features
- Voice interface

## 4. Recommendation
Start with MVP to validate demand, then iterate toward Standard.

## 5. Next Steps
1. Set up project structure
2. Implement Google Calendar API integration
3. Create basic email template
4. Deploy and test with 5 users
```

---

<p align="center">
  <strong>/brainstorm Skill / 头脑风暴技能</strong><br>
  <em>Think before you build. / 构建前先思考。</em>
</p>
