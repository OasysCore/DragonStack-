# DragonStack Project Management Guidelines / 龙栈项目管理准则

> **Version 2.0** | Last Updated: 2026-03-23  
> **版权所有**: OASYS CORE INTERNATIONAL LIMITED / 潤芯國際(香港)有限公司

---

## 📋 Table of Contents / 目录

1. [Project Lifecycle / 项目生命周期](#1-project-lifecycle--项目生命周期)
2. [Development Rules / 开发规则](#2-development-rules--开发规则)
3. [Error Collection & Learning / 错误收集与学习](#3-error-collection--learning--错误收集与学习)
4. [Documentation Standards / 文档规范](#4-documentation-standards--文档规范)
5. [Quality Assurance / 质量保证](#5-quality-assurance--质量保证)
6. [Deployment Checklist / 部署检查清单](#6-deployment-checklist--部署检查清单)

---

## 1. Project Lifecycle / 项目生命周期

### 1.1 Phase Definitions / 阶段定义

```
构思 (Ideation) → 规划 (Planning) → 开发 (Development) → 测试 (Testing) → 部署 (Deployment) → 运维 (Operations)
```

### 1.2 Phase Gates / 阶段关卡

| Phase / 阶段 | Gate / 关卡 | Criteria / 标准 |
|-------------|------------|----------------|
| 构思 | Concept Review | 需求文档、可行性分析 |
| 规划 | Architecture Review | 技术方案、数据流图、API 设计 |
| 开发 | Code Complete | 功能实现、单元测试通过 |
| 测试 | QA Sign-off | 集成测试、性能测试、安全扫描 |
| 部署 | Release Ready | 部署文档、回滚方案、监控配置 |
| 运维 | Stable | 7天无 P0/P1 故障 |

---

## 2. Development Rules / 开发规则

### 2.1 Agent Responsibility Separation / Agent 职责分离

> **Rule 1**: Each agent has a single primary responsibility. No cross-role execution.
> **规则 1**: 每个 Agent 只有一个主要职责。禁止跨职责执行。

| Agent | Primary Role / 主要职责 | Forbidden Actions / 禁止行为 |
|-------|------------------------|----------------------------|
| **Angel (👼)** | 协调、沟通、任务分配 | ❌ 直接执行开发/研究/质检 |
| **Angel-dev-bot (🛠️)** | 开发任务、代码实现 | ❌ 跨职执行研究/质检 |
| **Angel-brainiac-bot (🧑‍🎓)** | 研究任务、知识更新 | ❌ 跨职执行开发/质检 |
| **Angel-QA-bot (✅)** | 质量把关、代码审查 | ❌ 跨职执行开发/研究 |

### 2.2 Task Delegation Protocol / 任务委派协议

```
User Request / 用户请求
    ↓
Angel (👼) Analysis / 分析
    ↓
Delegate to Sub-agent / 委派给子 Agent
    ↓
sessions_spawn(runtime="acp", agentId="...")
    ↓
Sub-agent Execution / 子 Agent 执行
    ↓
Report Back to Angel / 回报给 Angel
    ↓
Deliver to User / 交付给用户
```

### 2.3 Workspace Organization / 工作区组织

```
~/.openclaw/
├── workspace/                    # Angel (👼) 主协调员
│   ├── AGENTS.md
│   ├── SOUL.md
│   ├── USER.md
│   ├── TOOLS.md
│   └── memory/
│
└── workspace-work/               # 开发/研究/质检 Agent
    ├── projects/                 # 项目代码
    │   ├── dragonstack/         # DragonStack 项目
    │   ├── ai-video-douyin/     # AI 视频项目
    │   └── ...
    └── docs/                     # 项目文档
```

**Rule**: Main workspace stays clean. All project files go to `workspace-work/`.
**规则**: 主工作区保持简洁。所有项目文件放在 `workspace-work/`。

---

## 3. Error Collection & Learning / 错误收集与学习

### 3.1 Error Categories / 错误分类

| Category / 分类 | Description / 描述 | Storage / 存储位置 |
|----------------|-------------------|-------------------|
| **Development Errors** | 代码错误、逻辑错误 | `.learnings/ERRORS.md` |
| **System Errors** | 配置错误、环境问题 | `.learnings/ERRORS.md` |
| **API Errors** | 第三方 API 故障 | `.learnings/ERRORS.md` |
| **User Corrections** | 用户纠正的错误 | `.learnings/LEARNINGS.md` |
| **Knowledge Gaps** | 知识过时/错误 | `.learnings/LEARNINGS.md` |
| **Best Practices** | 发现更好的方法 | `.learnings/LEARNINGS.md` |

### 3.2 Error Documentation Template / 错误记录模板

```markdown
### [YYYY-MM-DD] Error Title / 错误标题

**Category / 分类**: Development / System / API / ...
**Project / 项目**: project-name
**Agent / 代理**: Angel-dev-bot

**Problem / 问题**:
- 发生了什么
- 错误信息
- 影响范围

**Root Cause / 根本原因**:
- 为什么会发生
- 代码/配置问题分析

**Solution / 解决方案**:
- 如何修复的
- 修复代码/配置

**Prevention / 预防措施**:
- 如何避免再次发生
- 检查清单更新
- 自动化检测

**References / 参考**:
- 相关文件
- 相关提交
```

### 3.3 Recent Error Collection (2026-03) / 近期错误收集

#### [2026-03-19] Douyin Upload Timeout / 抖音上传超时

**Category**: API / Integration  
**Project**: ai-video-douyin  
**Agent**: Angel-dev-bot

**Problem**:
- Playwright 能启动 Chrome
- 访问 `creator.douyin.com` 超时 30 秒
- Cookie 可能过期（3月18日获取）

**Root Cause**:
- 抖音反爬机制升级
- Cookie 有效期短
- 网络连接不稳定

**Solution**:
- 需要定期刷新 Cookie
- 考虑使用抖音开放平台 API（需申请）
- 添加重试机制和代理池

**Prevention**:
- 建立 Cookie 自动刷新机制
- 监控上传成功率
- 准备备选方案（快手优先）

---

#### [2026-03-17] E10 Workflow Drag-and-Drop Automation Failed / E10 工作流拖拽自动化失败

**Category**: UI Automation  
**Project**: yifeng-OA-Workflow  
**Agent**: Angel-dev-bot

**Problem**:
- 流程图设计器拖拽操作难以自动化
- 表单设计器拖拽难以自动化
- 验证码导致自动化登录失败

**Root Cause**:
- E10 使用复杂的 JavaScript 拖拽库
- 验证码是图片+干扰线，OCR 识别率低
- 页面元素 ID 动态生成

**Solution**:
- 表单设计改为手动完成
- 验证码需要人工协助
- 流程图节点配置改为 API 调用（如果可用）

**Prevention**:
- 评估自动化可行性 BEFORE 承诺
- 对于复杂 UI，准备半自动化方案
- 记录哪些系统适合自动化，哪些不适合

---

#### [2026-03-07] Cron Job Mass Failure / 定时任务大规模失败

**Category**: System / Configuration  
**Project**: Multiple  
**Agent**: Angel

**Problem**:
- 11 个定时任务连续失败
- Self-Healing Monitor 连续 16 次错误
- 财经报告、双色球、半导体研究等全部暂停

**Root Cause**:
- VPS 迁移后配置未完全同步
- API 密钥未正确配置
- 网络环境问题（VPS 在新加坡）

**Solution**:
- 禁用所有非核心任务，只保留 2 个
- 重新配置 API 密钥
- 建立轻量级健康检查脚本

**Prevention**:
- 迁移后必须运行验证脚本
- 建立任务依赖检查机制
- 核心任务和非核心任务分离

---

#### [2026-03-03] Web Search Service Unavailable / 网页搜索服务不可用

**Category**: API / External Service  
**Project**: ai-income-research  
**Agent**: Angel-brainiac-bot

**Problem**:
- `web_search` 服务连续 2 天不可用
- AI 收入研究日报无法获取最新数据

**Root Cause**:
- Brave Search API 限制
- 网络连接问题

**Solution**:
- 基于昨日报告生成延续性分析
- 标注数据局限性
- 准备备选搜索源

**Prevention**:
- 建立 API 健康检查
- 设计降级方案（使用缓存数据）
- 多搜索源配置

---

#### [2026-02-28] Binance Trading Tasks Disabled / 币安交易任务禁用

**Category**: Business Decision  
**Project**: binance-trading  
**Agent**: Angel

**Problem**:
- 币安交易研究报告任务停止
- 币安持仓监控停止

**Root Cause**:
- 用户明确要求停止（风险控制）
- 非技术问题

**Solution**:
- 保留币安消息监听器（每5分钟）
- 停止所有主动交易相关任务

**Prevention**:
- 记录业务决策原因
- 保留监听能力以便恢复

---

## 4. Documentation Standards / 文档规范

### 4.1 Bilingual Requirement / 双语要求

**Rule**: All documentation must have both English and Chinese versions.
**规则**: 所有文档必须包含中英文版本。

| File | English | Chinese |
|------|---------|---------|
| README | README.md | README.zh.md |
| Setup Guide | docs/setup.md | docs/setup.zh.md |
| Skills Reference | docs/skills.md | docs/skills.zh.md |
| Contributing | CONTRIBUTING.md | CONTRIBUTING.zh.md |

### 4.2 Memory Log Format / 记忆日志格式

```markdown
# YYYY-MM-DD 记忆日志 / Memory Log

## 🎯 今日目标 / Today's Goals
- [ ] Goal 1
- [ ] Goal 2

## ✅ 已完成 / Completed
- [x] Task 1
- [x] Task 2

## ❌ 遇到的问题 / Issues
- Issue 1
- Issue 2

## 📊 数据统计 / Statistics
| Metric | Value |
|--------|-------|
| Tasks | X |
| Errors | Y |

## 📝 备注 / Notes
...

---
*Recorded by [Agent] | YYYY-MM-DD HH:MM*
```

### 4.3 Code Comments / 代码注释

**Rule**: All code comments must be bilingual (English + Chinese).
**规则**: 所有代码注释必须双语（英文+中文）。

```python
# Initialize the API client / 初始化 API 客户端
api_client = APIClient(config)

# Fetch data from remote server / 从远程服务器获取数据
data = api_client.fetch(endpoint)

# Handle timeout error / 处理超时错误
if not data:
    logger.error("Timeout fetching data / 获取数据超时")
```

---

## 5. Quality Assurance / 质量保证

### 5.1 Code Review Checklist / 代码审查清单

- [ ] **Functionality / 功能**: Code works as intended
- [ ] **Style / 风格**: Follows project style guide
- [ ] **Documentation / 文档**: Functions have docstrings
- [ ] **Tests / 测试**: Unit tests included
- [ ] **Error Handling / 错误处理**: Edge cases handled
- [ ] **Security / 安全**: No obvious vulnerabilities
- [ ] **Performance / 性能**: No obvious bottlenecks
- [ ] **Bilingual / 双语**: Comments in EN+CN

### 5.2 Testing Requirements / 测试要求

| Test Type / 测试类型 | Required / 必需 | Coverage / 覆盖率 |
|---------------------|----------------|------------------|
| Unit Tests | ✅ Yes | > 70% |
| Integration Tests | ✅ Yes | Critical paths |
| E2E Tests | ⚠️ Recommended | Main workflows |
| Security Scan | ✅ Yes | OWASP Top 10 |
| Performance Test | ⚠️ Recommended | API endpoints |

---

## 6. Deployment Checklist / 部署检查清单

### 6.1 Pre-Deployment / 部署前

- [ ] All tests passing / 所有测试通过
- [ ] Code review approved / 代码审查通过
- [ ] Documentation updated / 文档已更新
- [ ] Environment variables configured / 环境变量已配置
- [ ] Database migrations ready / 数据库迁移就绪
- [ ] Rollback plan documented / 回滚方案已记录

### 6.2 Deployment / 部署

- [ ] Deploy to staging / 部署到预发布环境
- [ ] Run smoke tests / 运行冒烟测试
- [ ] Monitor for 30 minutes / 监控 30 分钟
- [ ] Deploy to production / 部署到生产环境
- [ ] Verify production health / 验证生产环境健康

### 6.3 Post-Deployment / 部署后

- [ ] Monitor for 24 hours / 监控 24 小时
- [ ] Check error logs / 检查错误日志
- [ ] Verify metrics / 验证指标
- [ ] Update status page / 更新状态页面
- [ ] Notify stakeholders / 通知相关人员

---

## Appendix A: Quick Reference / 快速参考

### A.1 Command Quick Reference / 命令速查

```bash
# Create new project / 创建新项目
dragonstack init project-name

# Run skill / 运行技能
dragonstack run brainstorm
dragonstack run code-review
dragonstack run ship

# Safety mode / 安全模式
dragonstack guard

# Update / 更新
dragonstack upgrade
```

### A.2 File Locations / 文件位置

| File | Location |
|------|----------|
| Main config | ~/.dragonstack/config.yaml |
| Project config | ./.dragonstack/config.yaml |
| Logs | ~/.dragonstack/logs/ |
| Templates | ~/.dragonstack/templates/ |

---

<p align="center">
  <strong>DragonStack Project Management Guidelines / 龙栈项目管理准则</strong><br>
  <em>Ship like a team of twenty. / 一人抵二十人团队。</em><br>
  <br>
  Copyright © 2026 OASYS CORE INTERNATIONAL LIMITED / 潤芯國際(香港)有限公司
</p>
