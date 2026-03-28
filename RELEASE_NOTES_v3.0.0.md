# DragonStack 3.0.0 Release Notes

## 🎉 DragonStack 3.0-2026.03.29 - MAWA Governance

**Release Date:** March 29, 2026  
**Codename:** "Governance"

**Version Format:** X.X-YYYY.MM.DD (Starting with this release)

---

## 🚀 Major New Features

### 1. MAWA Governance Layer

DragonStack 3.0 introduces the **MAWA (Managing Agent + Worker Agent)** governance architecture:

- **📋 Registration** - Skill capability boundaries and constraints
- **📖 Playbook** - Execution strategy with automatic evolution
- **📝 TaskRun** - Complete audit trail for every execution
- **🎯 Dispatcher** - Intelligent routing with natural language support

### 2. Natural Language Mode

Just describe what you want:

```bash
./dragonstack --natural "帮我设计一个电商系统"
./dragonstack "创建一个用户认证 API"
```

### 3. Skill Evolution System

Skills automatically evolve based on performance:

```
PILOT → BETA → STABLE → SOTA
(10次)   (50次)   (100次)   (连续学习)
 70%      85%      95%
```

### 4. Execution Audit Trail

Every command is logged with full traceability:

```bash
./dragonstack taskruns  # View recent executions
```

---

## 📊 MAWA Architecture

```
┌─────────────────────────────────────────────────┐
│              MAWA Governance Layer               │
├─────────────────────────────────────────────────┤
│  📋 Registration  │  Skill capability boundaries │
│  📖 Playbook      │  Execution strategy evolution│
│  📝 TaskRun       │  Audit trail & traceability  │
│  🎯 Dispatcher    │  Intelligent routing engine  │
└─────────────────────────────────────────────────┘
                      │
┌─────────────────────────────────────────────────┐
│              9 DragonStack Skills                │
│  brainstorm → design → code → review → test →   │
│  ship + debug + doc + refactor                   │
└─────────────────────────────────────────────────┘
```

---

## 🆕 New Commands

### Natural Language
```bash
./dragonstack --natural "your request here"
./dragonstack -n "your request here"
```

### MAWA Status
```bash
./dragonstack mawa-status
```

### Inspect Skill
```bash
./dragonstack mawa-inspect <skill-name>
```

### View TaskRuns
```bash
./dragonstack taskruns [limit]
```

---

## 🔧 Technical Changes

### New Files
- `mawa/core.sh` - MAWA core functionality
- `mawa/registry/` - Skill registrations
- `mawa/playbook/` - Execution strategies
- `mawa/taskrun/` - Audit logs
- `mawa/dispatcher/` - Routing configuration

### Modified Files
- `dragonstack` - Added MAWA integration and natural language support
- `README.md` - Updated for 3.0 features

### Dependencies
- Added `bc` (basic calculator) for metrics calculation

---

## 🔄 Migration from 2.x

### Automatic Migration
Existing projects will automatically use MAWA features when updated:

```bash
# Update DragonStack
curl -fsSL https://raw.githubusercontent.com/OasysCore/DragonStack-/main/install.sh | bash

# Your existing projects work without changes
./dragonstack brainstorm  # Still works as before
```

### New Capabilities
After migration, you can use:
- Natural language mode
- MAWA status commands
- TaskRun audit trail
- Skill evolution tracking

---

## 🐛 Bug Fixes

- None (major version with new features)

---

## 📝 Known Issues

- Natural language dispatch uses keyword matching (NLP enhancement planned for 3.1)
- TaskRun files accumulate over time (cleanup utility planned)

---

## 🎯 What's Next

### DragonStack 3.1 (Planned)
- Enhanced NLP for natural language dispatch
- TaskRun cleanup utility
- Web dashboard for MAWA metrics

### DragonStack 4.0 (Planned)
- Full MAWA IPCP protocol implementation
- Multi-agent orchestration
- Self-healing capabilities

---

## 🙏 Credits

- **MAWA Architecture** - Inspired by [Capsio-Michael/mawa](https://github.com/Capsio-Michael/mawa)
- **Original Concept** - Inspired by [garrytan/gstack](https://github.com/garrytan/gstack)
- **Development** - Angel (OpenClaw Agent)

---

## 📦 Version Format

Starting from this release, DragonStack uses a new version format:

```
MAJOR.MINOR-YYYY.MM.DD

Example: 3.0-2026.03.29
```

- **MAJOR**: Major version (breaking changes)
- **MINOR**: Minor version (new features)
- **YYYY.MM.DD**: Release date

This format provides clear timeline visibility and makes it easy to track when each version was released.

## 📦 Installation

```bash
# Fresh install
curl -fsSL https://raw.githubusercontent.com/OasysCore/DragonStack-/main/install.sh | bash

# Or update existing
curl -fsSL https://raw.githubusercontent.com/OasysCore/DragonStack-/main/install.sh | bash
```

---

## 📋 Completed Features

This release includes all planned 3.0 features:

- ✅ MAWA Governance Layer (Registration/Playbook/TaskRun/Dispatcher)
- ✅ Natural Language Dispatch Mode
- ✅ Skill Evolution System (PILOT → BETA → STABLE → SOTA)
- ✅ Execution Audit Trail
- ✅ Cross-platform support (macOS/Linux)
- ✅ Auto-registration of skills
- ✅ TaskRun logging and history

---

<p align="center">
  <strong>DragonStack 3.0-2026.03.29</strong><br>
  <em>MAWA Governance × AI Development</em><br>
  <br>
  🐉
</p>
