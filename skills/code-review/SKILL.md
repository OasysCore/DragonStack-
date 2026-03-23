# Code Review Skill / 代码审查技能

> Staff Engineer-level code review / Staff Engineer 级别代码审查

---

## 🎯 Purpose / 目的

The `/code-review` skill performs a comprehensive code review to catch issues before they reach production. It checks for bugs, security vulnerabilities, performance problems, and code style issues.

`/code-review` 技能执行全面的代码审查，在问题到达生产环境之前捕获它们。它检查错误、安全漏洞、性能问题和代码风格问题。

---

## 🚀 Usage / 使用

```
/code-review
[Optional: specify files or directories to review]

Examples:
/code-review
/code-review src/
/code-review src/components/Button.tsx
```

---

## 📝 Review Checklist / 审查清单

### 1. Logic Correctness / 逻辑正确ness

- [ ] No obvious bugs / 没有明显错误
- [ ] Edge cases handled / 边界情况已处理
- [ ] Error paths covered / 错误路径已覆盖
- [ ] Race conditions checked / 竞争条件已检查

### 2. Code Style / 代码风格

- [ ] Consistent formatting / 格式一致
- [ ] Meaningful variable names / 有意义的变量名
- [ ] Functions are focused / 函数专注
- [ ] Comments where needed / 需要时有注释

### 3. Security / 安全

- [ ] No SQL injection risks / 无 SQL 注入风险
- [ ] No XSS vulnerabilities / 无 XSS 漏洞
- [ ] Input validation / 输入验证
- [ ] Sensitive data protected / 敏感数据受保护

### 4. Performance / 性能

- [ ] No unnecessary loops / 无不必要的循环
- [ ] Efficient data structures / 高效的数据结构
- [ ] No memory leaks / 无内存泄漏
- [ ] Async operations optimized / 异步操作已优化

### 5. Maintainability / 可维护性

- [ ] DRY principle followed / 遵循 DRY 原则
- [ ] Single responsibility / 单一职责
- [ ] Testable code / 可测试代码
- [ ] Documentation complete / 文档完整

---

## 📤 Output / 输出

### Review Report / 审查报告

```markdown
# Code Review Report / 代码审查报告

**Date / 日期**: YYYY-MM-DD  
**Reviewer / 审查者**: DragonStack /code-review  
**Scope / 范围**: [Files reviewed]

## Summary / 摘要

| Category / 分类 | Issues / 问题 | Status / 状态 |
|----------------|--------------|--------------|
| Critical / 严重 | 0 | ✅ Pass |
| Warning / 警告 | 2 | ⚠️ Review |
| Info / 信息 | 5 | ℹ️ Note |

## Findings / 发现

### [AUTO-FIXED] Issue 1 / 问题 1
- **Location / 位置**: `src/utils.ts:45`
- **Problem / 问题**: Unused import / 未使用的导入
- **Fix / 修复**: Removed import / 已移除导入

### [MANUAL REVIEW] Issue 2 / 问题 2
- **Location / 位置**: `src/api.ts:23`
- **Problem / 问题**: No input validation / 无输入验证
- **Recommendation / 建议**: Add validation middleware / 添加验证中间件

## Recommendations / 建议

1. [Recommendation 1]
2. [Recommendation 2]

## Action Items / 行动项

- [ ] Fix Issue 2 / 修复问题 2
- [ ] Add tests for edge cases / 为边界情况添加测试
- [ ] Update documentation / 更新文档
```

---

## 🔧 Auto-Fixes / 自动修复

The following issues are auto-fixed: / 以下问题会自动修复：

| Issue / 问题 | Fix / 修复 |
|-------------|-----------|
| Unused imports / 未使用的导入 | Remove / 移除 |
| Trailing whitespace / 尾随空格 | Trim / 修剪 |
| Missing semicolons / 缺失分号 | Add / 添加 |
| Simple style issues / 简单风格问题 | Format / 格式化 |

---

## 💡 Tips / 技巧

1. **Review early, review often / 及早审查，经常审查**
   - Don't wait until the end / 不要等到最后
   - Small reviews are better / 小审查更好

2. **Focus on critical issues first / 先关注关键问题**
   - Bugs before style / 错误先于风格
   - Security is paramount / 安全至上

3. **Be constructive / 建设性**
   - Explain why, not just what / 解释为什么，不只是什么
   - Suggest improvements / 建议改进

---

## 🔗 Next Skills / 下一步技能

After `/code-review`: / 使用 `/code-review` 后：

1. Fix identified issues / 修复识别的问题
2. Run `/qa-test` for functional testing / 运行 `/qa-test` 进行功能测试
3. Run `/security` for security audit / 运行 `/security` 进行安全审计
4. Run `/ship` to create PR / 运行 `/ship` 创建 PR

---

<p align="center">
  <strong>/code-review Skill / 代码审查技能</strong><br>
  <em>Catch bugs before they catch you. / 在错误抓住你之前抓住它们。</em>
</p>
