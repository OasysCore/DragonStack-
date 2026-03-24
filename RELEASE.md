# DragonStack Release Process / 龙栈发布流程

## 版本号规则

使用语义化版本控制 (SemVer): `MAJOR.MINOR.PATCH`

- **MAJOR**: 不兼容的 API 变更
- **MINOR**: 向后兼容的功能新增
- **PATCH**: 向后兼容的问题修复

## 发布步骤

### 1. 准备发布

```bash
# 确保在 main 分支
git checkout main
git pull origin main

# 更新版本号（在 README.md 和 config.yaml 中）
# 更新 CHANGELOG.md
```

### 2. 创建 Tag

```bash
# 创建带注释的 tag
git tag -a v2.0.0 -m "DragonStack 2.0.0 - Interactive onboard, 6 skills, cross-platform"

# 推送 tag 到 GitHub
git push origin v2.0.0
```

### 3. 创建 GitHub Release

在 GitHub 网页上：
1. 进入 Releases 页面
2. 点击 "Draft a new release"
3. 选择刚推送的 tag (v2.0.0)
4. 填写 Release 标题和说明
5. 点击 "Publish release"

### 4. Release 说明模板

```markdown
## DragonStack 2.0.0

### 🎉 新特性
- 交互式安装向导 (onboard.sh)
- 6 个完整技能: brainstorm, design, code, review, test, ship
- 跨平台支持: macOS, Linux, Windows
- 自动更新支持 (install.sh)

### 🚀 快速开始
\`\`\`bash
curl -fsSL https://raw.githubusercontent.com/OasysCore/DragonStack-/main/install.sh | bash
\`\`\`

### 📦 更新日志
- 简化安装流程
- 统一命令行接口
- 完整文档合并

### 🙏 致谢
感谢 Garry Tan 的 gstack 提供的灵感。
```

## 自动化发布（可选）

可以使用 GitHub Actions 自动创建 Release：

```yaml
# .github/workflows/release.yml
name: Release

on:
  push:
    tags:
      - 'v*'

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Create Release
        uses: actions/create-release@v1
        with:
          tag_name: ${{ github.ref }}
          release_name: Release ${{ github.ref }}
          body: See CHANGELOG.md for details
```

## 历史版本

| 版本 | 日期 | 主要特性 |
|------|------|---------|
| v2.0.0 | 2026-03-23 | 交互式安装，6技能，跨平台 |
| v1.0.0 | 2026-03-20 | 初始版本，3技能 |
