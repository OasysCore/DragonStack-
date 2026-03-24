#!/bin/bash
# Refactor Skill Script / 重构技能脚本
# Copyright (c) 2026 OASYS CORE INTERNATIONAL LIMITED / 潤芯國際(香港)有限公司

set -e

echo "🔧 DragonStack Refactor Skill / 重构技能"
echo "========================================="
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Check if we're in a project directory
if [ ! -f "./DRAGONSTACK.md" ] && [ ! -d "./.dragonstack" ]; then
    echo -e "${YELLOW}⚠️  No DragonStack project detected / 未检测到龙栈项目${NC}"
    echo "Run this from your project root / 请从项目根目录运行"
    exit 1
fi

# Create directories
mkdir -p docs
mkdir -p refactor

# Get current date
DATE=$(date +%Y-%m-%d)
OUTPUT_FILE="docs/refactor-${DATE}.md"

echo -e "${BLUE}🔧 Refactoring Framework / 重构框架${NC}"
echo ""
echo "This skill will help you: / 本技能将帮助你："
echo "  1. Identify code smells / 识别代码异味"
echo "  2. Plan refactoring steps / 规划重构步骤"
echo "  3. Execute safe refactoring / 执行安全重构"
echo "  4. Verify improvements / 验证改进"
echo ""

# Prompt user for input
echo -e "${YELLOW}💡 What do you want to refactor? / 你想重构什么？${NC}"
echo "   (File, module, or describe the code smell)"
echo "   （文件、模块，或描述代码异味）"
echo ""
echo "   Type your description and press Ctrl+D when done:"
echo "   输入你的描述，完成后按 Ctrl+D："
echo ""

# Read user input
REFACTOR_TARGET=$(cat)

# Generate refactoring plan
echo ""
echo -e "${BLUE}📝 Generating refactoring plan... / 生成重构计划...${NC}"

cat > "$OUTPUT_FILE" << EOF
# Refactoring Plan / 重构计划

**Date / 日期**: ${DATE}  
**Project / 项目**: $(basename "$(pwd)")  
**Skill / 技能**: /refactor  
**Target / 目标**: ${REFACTOR_TARGET}

---

## 1. Current State Analysis / 当前状态分析

### 1.1 Target Description / 目标描述

${REFACTOR_TARGET}

### 1.2 Code Smells Identified / 识别的代码异味

- [ ] **Long Method / 长方法** - Method does too many things / 方法做太多事情
- [ ] **Large Class / 大类** - Class has too many responsibilities / 类有太多职责
- [ ] **Duplicate Code / 重复代码** - Same code in multiple places / 多处相同代码
- [ ] **Long Parameter List / 长参数列表** - Too many parameters / 太多参数
- [ ] **Feature Envy / 特性嫉妒** - Method uses more data from another class / 方法使用更多其他类的数据
- [ ] **Data Clumps / 数据泥团** - Groups of data always together / 总是一起的数据组
- [ ] **Primitive Obsession / 基本类型偏执** - Using primitives instead of objects / 使用基本类型而非对象
- [ ] **Switch Statements / Switch 语句** - Complex conditional logic / 复杂的条件逻辑
- [ ] **Temporary Field / 临时字段** - Fields only used in some circumstances / 只在某些情况下使用的字段
- [ ] **Refused Bequest / 被拒绝的遗赠** - Subclass doesn't use parent's interface / 子类不使用父类接口

### 1.3 Technical Debt Assessment / 技术债务评估

| Metric / 指标 | Before / 重构前 | After / 重构后 |
|--------------|----------------|---------------|
| Lines of Code / 代码行数 | ? | ? |
| Cyclomatic Complexity / 圈复杂度 | ? | ? |
| Code Duplication / 代码重复 | ? | ? |
| Test Coverage / 测试覆盖率 | ? | ? |

---

## 2. Refactoring Strategy / 重构策略

### 2.1 Refactoring Techniques / 重构技术

Select applicable techniques / 选择适用的技术：

- [ ] **Extract Method / 提取方法** - Break long methods into smaller ones / 将长方法拆分为小方法
- [ ] **Extract Class / 提取类** - Split large class into smaller classes / 将大类拆分为小类
- [ ] **Move Method / 移动方法** - Move method to appropriate class / 将方法移动到合适的类
- [ ] **Rename Variable/Method / 重命名变量/方法** - Improve naming / 改进命名
- [ ] **Replace Conditional with Polymorphism / 用多态替换条件** - Simplify conditionals / 简化条件
- [ ] **Introduce Parameter Object / 引入参数对象** - Group related parameters / 组合相关参数
- [ ] **Replace Magic Numbers / 替换魔法数字** - Use named constants / 使用命名常量
- [ ] **Remove Duplication / 消除重复** - Apply DRY principle / 应用 DRY 原则

### 2.2 Refactoring Steps / 重构步骤

#### Step 1: Preparation / 准备
- [ ] Ensure tests exist and pass / 确保测试存在并通过
- [ ] Create backup branch / 创建备份分支
- [ ] Set up monitoring/metrics / 设置监控/指标

#### Step 2: [Specific Refactoring] / [具体重构]

**Description / 描述**: [What will be changed]

**Files Affected / 影响的文件**:
- [file1]
- [file2]

**Changes / 变更**:
```diff
- old code
+ new code
```

**Rationale / 理由**: [Why this change]

#### Step 3: Verification / 验证
- [ ] All tests pass / 所有测试通过
- [ ] No regression in functionality / 功能无回归
- [ ] Performance maintained or improved / 性能保持或提升
- [ ] Code review completed / 代码审查完成

---

## 3. Safety Measures / 安全措施

### 3.1 Pre-Refactoring Checklist / 重构前检查清单

- [ ] Code is under version control / 代码在版本控制下
- [ ] Tests exist for the target code / 目标代码有测试
- [ ] All tests pass before refactoring / 重构前所有测试通过
- [ ] Backup branch created / 已创建备份分支
- [ ] Team notified of refactoring / 团队已收到重构通知

### 3.2 During Refactoring / 重构期间

- [ ] Make small, incremental changes / 进行小的增量更改
- [ ] Run tests after each change / 每次更改后运行测试
- [ ] Commit frequently / 频繁提交
- [ ] Stop if tests fail / 如果测试失败则停止

### 3.3 Post-Refactoring / 重构后

- [ ] All tests pass / 所有测试通过
- [ ] Code review completed / 代码审查完成
- [ ] Documentation updated / 文档已更新
- [ ] Performance verified / 性能已验证
- [ ] Team informed of changes / 团队已获知变更

---

## 4. Rollback Plan / 回滚计划

If refactoring fails / 如果重构失败：

1. **Immediate Rollback / 立即回滚**:
   ```bash
   git checkout backup-branch
   git branch -D refactor-branch
   ```

2. **Partial Rollback / 部分回滚**:
   ```bash
   git revert [commit-hash]
   ```

3. **Communication / 沟通**:
   - Notify team of rollback / 通知团队回滚
   - Document lessons learned / 记录经验教训

---

## 5. Expected Improvements / 预期改进

### 5.1 Code Quality / 代码质量

| Aspect / 方面 | Before / 之前 | After / 之后 |
|--------------|--------------|-------------|
| Readability / 可读性 | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Maintainability / 可维护性 | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Testability / 可测试性 | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Performance / 性能 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |

### 5.2 Metrics / 指标

- **Lines of Code / 代码行数**: -X% (reduction / 减少)
- **Cyclomatic Complexity / 圈复杂度**: -X% (reduction / 减少)
- **Code Duplication / 代码重复**: -X% (reduction / 减少)
- **Test Coverage / 测试覆盖率**: +X% (increase / 增加)

---

## 6. Action Items / 行动项

- [ ] Review this refactoring plan / 审查此重构计划
- [ ] Create backup branch / 创建备份分支
- [ ] Write/update tests / 编写/更新测试
- [ ] Execute refactoring steps / 执行重构步骤
- [ ] Run /test to verify / 运行 /test 验证
- [ ] Run /code-review for quality check / 运行 /code-review 进行质量检查
- [ ] Update documentation / 更新文档
- [ ] Merge changes / 合并更改

---

*Generated by DragonStack /refactor skill / 由龙栈 /refactor 技能生成*
EOF

echo ""
echo -e "${GREEN}✅ Refactoring plan created! / 重构计划已创建！${NC}"
echo ""
echo "📄 Output file / 输出文件: ${OUTPUT_FILE}"
echo ""
echo -e "${YELLOW}📋 Refactoring Principles / 重构原则:${NC}"
echo ""
echo "   1. 🧪 Tests First / 测试优先"
echo "      - Ensure tests exist before refactoring / 重构前确保测试存在"
echo "      - Tests should pass before and after / 重构前后测试都应该通过"
echo ""
echo "   2. 🔄 Small Steps / 小步骤"
echo "      - Make one change at a time / 一次做一个更改"
echo "      - Commit after each successful change / 每次成功更改后提交"
echo ""
echo "   3. 🛡️  Safety Net / 安全网"
echo "      - Keep backup branch / 保留备份分支"
echo "      - Run tests frequently / 频繁运行测试"
echo "      - Stop if tests fail / 如果测试失败则停止"
echo ""
echo "   4. 📊 Measure Impact / 测量影响"
echo "      - Track code metrics / 跟踪代码指标"
echo "      - Verify performance / 验证性能"
echo "      - Document improvements / 记录改进"
echo ""
echo -e "${YELLOW}📋 Next steps / 下一步:${NC}"
echo "   1. Review the refactoring plan / 审查重构计划"
echo "   2. Create backup branch: git checkout -b refactor/backup / 创建备份分支"
echo "   3. Ensure tests exist and pass / 确保测试存在并通过"
echo "   4. Execute refactoring steps / 执行重构步骤"
echo "   5. Run /test after each change / 每次更改后运行 /test"
echo "   6. Run /code-review before merging / 合并前运行 /code-review"
echo ""
echo "🔧 Happy refactoring! / 重构愉快！"
