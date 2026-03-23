# DragonStack Bug Report / 错误报告

> 记录和追踪 DragonStack 项目的所有 Bug 和修复

---

## Bug #001: setup.sh macOS 兼容性问题

### 基本信息
| 项目 | 内容 |
|------|------|
| **Bug ID** | #001 |
| **标题** | setup.sh 在 macOS 上运行失败：bad substitution |
| **状态** | ✅ 已修复 |
| **严重程度** | 高（影响安装） |
| **报告时间** | 2026-03-23 |
| **修复时间** | 2026-03-23 |

### 问题描述
在 macOS 上执行 `./.dragonstack/scripts/setup.sh` 时，第 59 行出现错误：
```
./.dragonstack/scripts/setup.sh: line 59: $SCRIPT_DIR/templates/${PLATFORM^^}.md.template: bad substitution
```

### 复现步骤
1. 在 macOS 上克隆 DragonStack 仓库
2. 运行 `./setup.sh` 或 `./.dragonstack/scripts/setup.sh`
3. 脚本在 "Copying templates" 步骤失败

### 根本原因
`${PLATFORM^^}` 是 Bash 4.0+ 的大小写转换语法，但 macOS 默认使用 Bash 3.2，不支持此语法。

### 影响范围
- 所有 macOS 用户无法完成安装
- Linux 用户不受影响（通常使用 Bash 4.0+）

### 修复方案
**修改前：**
```bash
if [ -f "$SCRIPT_DIR/templates/${PLATFORM^^}.md.template" ]; then
    cp "$SCRIPT_DIR/templates/${PLATFORM^^}.md.template" ./DRAGONSTACK.md
```

**修改后：**
```bash
PLATFORM_UPPER=$(echo "$PLATFORM" | tr '[:lower:]' '[:upper:]')
if [ -f "$SCRIPT_DIR/templates/${PLATFORM_UPPER}.md.template" ]; then
    cp "$SCRIPT_DIR/templates/${PLATFORM_UPPER}.md.template" ./DRAGONSTACK.md
```

### 验证
- [x] 在 macOS 上测试通过
- [x] 在 Linux 上测试通过
- [x] 模板正确复制

### 提交信息
```
Fix setup.sh bash compatibility issue for macOS

Replace ${PLATFORM^^} with $(echo $PLATFORM | tr '[:lower:]' '[:upper:]')
for macOS Bash 3.2 compatibility.
```

### 相关文件
- `scripts/setup.sh`

### 经验教训
1. 使用 POSIX 兼容的语法，避免 Bash 4.0+ 特有功能
2. 在多种操作系统上测试脚本
3. 使用 `tr` 命令进行大小写转换更可靠

---

## Bug 报告模板

### 新 Bug 报告格式

```markdown
## Bug #[ID]: [标题]

### 基本信息
| 项目 | 内容 |
|------|------|
| **Bug ID** | #[ID] |
| **标题** | [简短描述] |
| **状态** | 🆕 新发现 / 🔧 修复中 / ✅ 已修复 / ⏸️ 搁置 |
| **严重程度** | 严重 / 高 / 中 / 低 |
| **报告时间** | YYYY-MM-DD |
| **修复时间** | YYYY-MM-DD |

### 问题描述
[详细描述问题现象]

### 复现步骤
1. [步骤 1]
2. [步骤 2]
3. [步骤 3]

### 期望行为
[应该发生什么]

### 实际行为
[实际发生了什么]

### 环境信息
- OS: [操作系统]
- Shell: [Bash/Zsh 版本]
- Node.js: [版本]
- Git: [版本]

### 错误日志
```
[粘贴错误信息]
```

### 根本原因
[分析问题原因]

### 修复方案
[描述如何修复]

### 验证
- [ ] 测试通过
- [ ] 文档更新
- [ ] 回归测试

### 提交信息
```
[Git commit message]
```

### 相关文件
- [文件 1]
- [文件 2]

### 经验教训
[学到了什么，如何避免类似问题]
```

---

## 统计

| 状态 | 数量 |
|------|------|
| 🆕 新发现 | 0 |
| 🔧 修复中 | 0 |
| ✅ 已修复 | 1 |
| ⏸️ 搁置 | 0 |
| **总计** | **1** |

---

<p align="center">
  <strong>DragonStack Bug Report</strong><br>
  <em>记录问题，持续改进</em>
</p>
