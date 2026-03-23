# DragonStack 完整使用指南 / Complete Usage Guide

> 一步一步教你如何使用龙栈进行开发

---

## 📋 目录

1. [快速开始](#快速开始)
2. [技能详解](#技能详解)
3. [完整工作流示例](#完整工作流示例)
4. [常见问题](#常见问题)

---

## 快速开始

### 第一步：安装龙栈

```bash
# 1. 克隆龙栈到本地
git clone https://github.com/OasysCore/DragonStack-.git ~/.dragonstack

# 2. 进入你的项目目录
cd /path/to/your/project

# 3. 复制龙栈到项目
cp -r ~/.dragonstack .dragonstack

# 4. 运行安装脚本
./.dragonstack/scripts/setup.sh
```

**安装成功后会看到：**
```
✅ DragonStack setup complete! / 龙栈安装完成！
```

---

### 第二步：开始使用

龙栈提供 3 个核心技能脚本：

| 技能 | 命令 | 用途 |
|------|------|------|
| `/brainstorm` | `./.dragonstack/skills/brainstorm/brainstorm.sh` | 产品构思 |
| `/code-review` | `./.dragonstack/skills/code-review/code-review.sh` | 代码审查 |
| `/ship` | `./.dragonstack/skills/ship/ship.sh` | 一键发布 |

---

## 技能详解

### 1. /brainstorm - 产品构思

**什么时候用**：开始新项目或新功能前

**怎么用**：
```bash
./.dragonstack/skills/brainstorm/brainstorm.sh
```

**步骤**：
1. 运行命令
2. 输入你的产品想法
3. 按 `Ctrl+D` 结束输入
4. 查看生成的文档 `docs/brainstorm-YYYY-MM-DD.md`

**示例**：
```
🧠 DragonStack Brainstorm Skill / 头脑风暴技能
===============================================

💡 Describe your product idea / 描述你的产品想法:
   (What problem are you solving? Who is it for?)
   （你在解决什么问题？为谁而做？）

   Type your idea and press Ctrl+D when done:
   输入你的想法，完成后按 Ctrl+D：

我想做一个每日简报应用，聚合日历事件、天气和交通信息
[按 Ctrl+D]

📝 Generating design document... / 生成设计文档...
✅ Brainstorm document created! / 头脑风暴文档已创建！

📄 Output file / 输出文件: docs/brainstorm-2026-03-23.md
```

**输出内容**：
- 5W1H 分析框架
- 问题重构
- 三种解决方案（MVP/标准/愿景）
- 下一步行动清单

---

### 2. /code-review - 代码审查

**什么时候用**：写完代码后，提交前

**怎么用**：
```bash
./.dragonstack/skills/code-review/code-review.sh
```

**步骤**：
1. 运行命令
2. 查看找到的文件列表
3. 检查生成的审查报告 `docs/code-review-YYYY-MM-DD.md`
4. 根据检查清单逐项审查
5. 修复发现的问题

**输出内容**：
- 检查清单（逻辑/风格/安全/性能/可维护性）
- 发现的问题
- 行动项清单

---

### 3. /ship - 一键发布

**什么时候用**：代码完成，准备发布

**怎么用**：
```bash
./.dragonstack/skills/ship/ship.sh
```

**步骤**：
1. 运行命令
2. 查看更改的文件
3. 确认继续
4. 输入提交信息
5. 自动提交并推送
6. 查看发布报告

**输出内容**：
- 发布摘要
- 提交详情
- 下一步行动（创建 PR 等）

---

## 完整工作流示例

### 场景：开发一个新功能

#### Step 1: 产品构思
```bash
./.dragonstack/skills/brainstorm/brainstorm.sh
```
输入想法 → 生成设计文档 → 查看 `docs/brainstorm-2026-03-23.md`

#### Step 2: 开发实现
根据设计文档写代码...

#### Step 3: 代码审查
```bash
./.dragonstack/skills/code-review/code-review.sh
```
查看报告 → 修复问题 → 再次审查

#### Step 4: 一键发布
```bash
./.dragonstack/skills/ship/ship.sh
```
确认更改 → 输入提交信息 → 自动推送

#### Step 5: 创建 PR
去 GitHub 创建 Pull Request

---

## 文件结构

使用龙栈后，你的项目会有这些文件：

```
your-project/
├── .dragonstack/           # 龙栈配置
│   ├── config.yaml        # 配置文件
│   └── skills/            # 技能脚本
│       ├── brainstorm/
│       ├── code-review/
│       └── ship/
├── docs/                   # 生成的文档
│   ├── brainstorm-2026-03-23.md
│   ├── code-review-2026-03-23.md
│   └── ship-2026-03-23.md
├── src/                    # 你的代码
├── DRAGONSTACK.md         # 项目配置
└── ...
```

---

## 常见问题

### Q1: 运行脚本时提示 "Permission denied"
**解决**：添加执行权限
```bash
chmod +x ./.dragonstack/skills/*/ *.sh
```

### Q2: 提示 "No DragonStack project detected"
**解决**：确保你在项目根目录运行，且已安装龙栈

### Q3: 生成的文档在哪里？
**回答**：在 `docs/` 目录下，文件名包含日期

### Q4: 可以修改生成的文档吗？
**回答**：可以！文档是 Markdown 格式，可以直接编辑

### Q5: 如何更新龙栈？
**解决**：
```bash
cd ~/.dragonstack && git pull origin main
cd /your/project
rm -rf .dragonstack && cp -r ~/.dragonstack .dragonstack
```

---

## 提示和技巧

1. **定期运行 /brainstorm**：即使小功能也可以先构思
2. **代码审查 checklist**：可以打印出来对照检查
3. **/ship 前确保测试通过**：脚本会询问是否继续
4. **文档即代码**：生成的文档是项目的重要资产

---

## 下一步学习

- 阅读 `docs/skills.md` 了解更多技能
- 查看 `examples/` 中的示例项目
- 贡献代码到 GitHub: https://github.com/OasysCore/DragonStack-

---

<p align="center">
  <strong>DragonStack 使用指南</strong><br>
  <em>一人抵二十人团队</em><br>
  <br>
  Made with ❤️ by OASYS CORE INTERNATIONAL LIMITED
</p>
