# Platform Comparison / 平台对比

> Trae vs Cursor vs Others: Choose your weapon / 选择你的武器  
> Last Updated: 2026-03-23

---

## 🏆 Quick Comparison / 快速对比

| Feature / 功能 | Trae | Cursor | Codeium | 通义灵码 |
|---------------|------|--------|---------|---------|
| **Availability / 可用性** | ✅ 国内直连 | ⚠️ 需代理 | ✅ 国内 | ✅ 国内 |
| **Cost / 成本** | 免费 | $20/月 | 免费额度 | 免费额度 |
| **AI Model / AI 模型** | Claude 3.5 | GPT-4/Claude | 多模型 | CodeQwen |
| **Chinese Support / 中文支持** | ⭐⭐⭐ | ⭐⭐ | ⭐⭐ | ⭐⭐⭐ |
| **Code Completion / 代码补全** | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐ | ⭐⭐ |
| **Multi-file Edit / 多文件编辑** | ✅ | ✅ (Composer) | ⚠️ | ❌ |
| **Terminal Integration / 终端集成** | ✅ | ✅ | ⚠️ | ❌ |
| **Extension Ecosystem / 插件生态** | 有限 | 丰富 | 有限 | 有限 |

---

## 🥇 Trae (Recommended / 推荐)

**By**: ByteDance / 字节跳动  
**Website**: https://www.trae.ai/

### Pros / 优势

- ✅ **Free / 完全免费** - No usage limits
- ✅ **Domestic Network / 国内网络** - No proxy needed
- ✅ **Claude 3.5 / Claude 3.5** - Best-in-class code generation
- ✅ **Builder Mode / Builder 模式** - Multi-step task execution
- ✅ **Chinese UI / 中文界面** - Native Chinese support

### Cons / 劣势

- ⚠️ **New Product / 新产品** - Less mature than Cursor
- ⚠️ **Limited Extensions / 插件有限** - Smaller ecosystem
- ⚠️ **No API / 无 API** - Cannot integrate with other tools

### Best For / 最适合

- Chinese developers / 中国开发者
- Users without proxy access / 无代理用户
- Cost-conscious users / 注重成本的用户
- Claude Code users switching to domestic platform / 从 Claude Code 切换到国内平台

### Setup / 设置

```bash
# Download from / 下载地址:
# https://www.trae.ai/

# After installation / 安装后:
# 1. Open Trae / 打开 Trae
# 2. Sign in (optional) / 登录（可选）
# 3. Start coding with AI / 开始 AI 编程
```

---

## 🥈 Cursor (Advanced / 进阶)

**By**: Anysphere  
**Website**: https://cursor.sh/

### Pros / 优势

- ✅ **Best Features / 功能最强** - Industry-leading capabilities
- ✅ **Composer Mode / Composer 模式** - Multi-file editing
- ✅ **Rich Extensions / 丰富插件** - VS Code compatible
- ✅ **GPT-4 & Claude / GPT-4 和 Claude** - Multiple models
- ✅ **Terminal AI / 终端 AI** - AI-powered terminal

### Cons / 劣势

- ❌ **Requires Proxy / 需代理** - Needs VPN for China
- ❌ **$20/month / $20/月** - Paid subscription
- ❌ **Limited Free Tier / 免费版有限** - 50 slow requests/month
- ⚠️ **Unstable Access / 访问不稳定** - Network issues in China

### Best For / 最适合

- Users with proxy access / 有代理用户
- Professional developers / 专业开发者
- Teams with budget / 有预算的团队
- Maximum productivity / 追求最高效率

### Setup / 设置

```bash
# Download from / 下载地址:
# https://cursor.sh/

# Requires / 需要:
# - Stable proxy / 稳定代理
# - Credit card for subscription / 信用卡订阅

# After installation / 安装后:
# 1. Open Cursor / 打开 Cursor
# 2. Sign in with account / 登录账户
# 3. Configure proxy if needed / 配置代理（如需要）
```

---

## 🥉 Codeium (Planned / 计划中)

**By**: Codeium  
**Website**: https://codeium.com/

### Pros / 优势

- ✅ **Free Tier / 免费额度** - Generous free usage
- ✅ **Fast / 快速** - Low latency
- ✅ **Multiple IDEs / 多 IDE** - VS Code, JetBrains, etc.

### Cons / 劣势

- ⚠️ **Less Powerful / 功能较弱** - Not as capable as Claude
- ⚠️ **Limited Context / 上下文有限** - Smaller context window

### Status / 状态

🚧 **Planned Support / 计划支持** - Coming in v1.1

---

## 🏅 通义灵码 (Planned / 计划中)

**By**: Alibaba Cloud / 阿里云  
**Website**: https://tongyi.aliyun.com/lingma

### Pros / 优势

- ✅ **Domestic / 国产** - Fully domestic solution
- ✅ **Alibaba Cloud / 阿里云** - Integrated with cloud services
- ✅ **CodeQwen / CodeQwen** - Optimized for Chinese code

### Cons / 劣势

- ⚠️ **Limited Features / 功能有限** - Basic code completion
- ⚠️ **Enterprise Focus / 企业导向** - Personal features limited

### Status / 状态

🚧 **Planned Support / 计划支持** - Coming in v1.2

---

## 🎯 Decision Matrix / 决策矩阵

### If you... / 如果你...

| Situation / 情况 | Recommended / 推荐 | Reason / 原因 |
|-----------------|-------------------|--------------|
| No proxy / 无代理 | **Trae** | 国内直连，免费 |
| Have proxy / 有代理 | **Cursor** | 功能最强 |
| Limited budget / 预算有限 | **Trae** | 完全免费 |
| Professional use / 专业使用 | **Cursor** | 功能最全 |
| Alibaba Cloud user / 阿里云用户 | **通义灵码** | 生态集成 |
| Beginner / 初学者 | **Trae** | 简单易用 |

---

## 🔧 Platform-Specific Setup / 平台特定设置

### Trae Setup / Trae 设置

```yaml
# .dragonstack/config.yaml
platform: trae
model: claude-3.5-sonnet
features:
  builder_mode: true
  terminal_ai: true
```

### Cursor Setup / Cursor 设置

```yaml
# .dragonstack/config.yaml
platform: cursor
model: gpt-4
features:
  composer_mode: true
  terminal_ai: true
```

---

## 📊 Performance Comparison / 性能对比

| Metric / 指标 | Trae | Cursor |
|--------------|------|--------|
| **Code Generation / 代码生成** | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Code Understanding / 代码理解** | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Multi-file Edit / 多文件编辑** | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Response Speed / 响应速度** | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| **Chinese Language / 中文语言** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| **Network Stability / 网络稳定性** | ⭐⭐⭐⭐⭐ | ⭐⭐ |

---

## 🚀 Migration Guide / 迁移指南

### From Claude Code to Trae / 从 Claude Code 到 Trae

1. **Install Trae** / 安装 Trae
2. **Export snippets** / 导出代码片段
3. **Recreate prompts** / 重新创建提示词
4. **Test workflows** / 测试工作流

### From Cursor to Trae / 从 Cursor 到 Trae

1. **Export settings** / 导出设置
2. **Backup projects** / 备份项目
3. **Install Trae** / 安装 Trae
4. **Import configurations** / 导入配置

---

<p align="center">
  <strong>Choose wisely. Ship faster. / 明智选择，更快发布。</strong>
</p>
