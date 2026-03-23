# Ship Skill / 发布技能

> Test → PR → Merge in one command / 测试 → PR → 合并一键完成

---

## 🎯 Purpose / 目的

The `/ship` skill automates the release process: running tests, creating a pull request, and preparing for deployment. It ensures nothing is forgotten before code goes live.

`/ship` 技能自动化发布流程：运行测试、创建拉取请求、准备部署。它确保代码上线前不会遗漏任何内容。

---

## 🚀 Usage / 使用

```
/ship
[Optional: --skip-tests, --draft, --message "Custom PR title"]

Examples:
/ship
/ship --draft
/ship --message "Add user authentication feature"
```

---

## 📝 Process / 流程

### Step 1: Pre-flight Checks / 步骤 1：飞行前检查

- [ ] Git status clean / Git 状态干净
- [ ] On feature branch / 在功能分支上
- [ ] Commits are meaningful / 提交有意义
- [ ] No uncommitted changes / 无未提交的更改

### Step 2: Sync with Main / 步骤 2：同步主分支

```bash
git fetch origin
git rebase origin/main
```

### Step 3: Run Tests / 步骤 3：运行测试

```bash
npm test
# or
yarn test
# or
make test
```

### Step 4: Coverage Check / 步骤 4：覆盖率检查

- Verify coverage threshold / 验证覆盖率阈值
- Report coverage metrics / 报告覆盖率指标

### Step 5: Create PR / 步骤 5：创建 PR

- Generate PR title and description / 生成 PR 标题和描述
- Link related issues / 链接相关问题
- Add labels / 添加标签

### Step 6: Push / 步骤 6：推送

```bash
git push origin feature-branch
```

---

## 📤 Output / 输出

```
🚀 DragonStack Ship Skill / 发布技能
=====================================

Step 1: Pre-flight checks ✅
Step 2: Sync with main ✅
Step 3: Run tests ✅ (42 passed, 0 failed)
Step 4: Coverage check ✅ (78% > 70% threshold)
Step 5: Create PR ✅
Step 6: Push ✅

=====================================
✅ Ship complete! / 发布完成！

📋 Pull Request: https://github.com/OasysCore/DragonStack-/pull/42
📝 Title: Add user authentication feature
🔍 Tests: 42 passed
📊 Coverage: 78%

Next steps / 下一步:
   1. Review the PR / 审查 PR
   2. Address any feedback / 处理反馈
   3. Merge when ready / 准备好后合并
   4. Run /deploy after merge / 合并后运行 /deploy
```

---

## ⚙️ Configuration / 配置

```yaml
# .dragonstack/config.yaml
ship:
  test_command: "npm test"
  coverage_threshold: 70
  draft_by_default: false
  auto_assign_reviewers: true
  require_approval: true
```

---

## 🛡️ Safety Features / 安全功能

### Pre-flight Protection / 飞行前保护

The skill will STOP if: / 技能会在以下情况停止：

- Tests are failing / 测试失败
- Coverage is below threshold / 覆盖率低于阈值
- Uncommitted changes exist / 存在未提交的更改
- Not on a feature branch / 不在功能分支上

### Confirmation Prompts / 确认提示

For destructive operations: / 对于破坏性操作：

```
⚠️ Warning: This will force push to origin/feature-branch
   警告：这将强制推送到 origin/feature-branch

Continue? (yes/no) / 继续？(是/否)
```

---

## 💡 Tips / 技巧

1. **Commit often / 经常提交**
   - Small, meaningful commits / 小而意义的提交
   - Easier to review / 更容易审查

2. **Write good commit messages / 写好提交信息**
   - Clear and descriptive / 清晰描述
   - Reference issues / 引用问题

3. **Test before shipping / 发布前测试**
   - Run tests locally first / 先在本地运行测试
   - Fix issues before PR / 在 PR 前修复问题

---

## 🔗 Next Skills / 下一步技能

After `/ship`: / 使用 `/ship` 后：

1. Review PR feedback / 审查 PR 反馈
2. Make requested changes / 进行请求的更改
3. Run `/ship` again to update / 再次运行 `/ship` 更新
4. Merge PR / 合并 PR
5. Run `/deploy` to deploy / 运行 `/deploy` 部署

---

<p align="center">
  <strong>/ship Skill / 发布技能</strong><br>
  <em>Ship with confidence. / 信心发布。</em>
</p>
