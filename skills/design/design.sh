#!/bin/bash
# Design Skill Script / 架构设计技能脚本
# Copyright (c) 2026 OASYS CORE INTERNATIONAL LIMITED / 潤芯國際(香港)有限公司

set -e

echo "🏗️  DragonStack Design Skill / 架构设计技能"
echo "=============================================="
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

# Parse arguments
USE_ACP=""
ACP_AGENT=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --use-acp)
            USE_ACP="true"
            ACP_AGENT="$2"
            shift 2
            ;;
        --help)
            echo "Usage: ./dragonstack design [options]"
            echo ""
            echo "Options:"
            echo "  --use-acp <agent>    Use ACP agent (codex, claude, pi)"
            echo "  --help              Show this help"
            exit 0
            ;;
        *)
            shift
            ;;
    esac
done

# Create directories
mkdir -p docs
mkdir -p architecture

# Get current date
DATE=$(date +%Y-%m-%d)
OUTPUT_FILE="docs/design-${DATE}.md"

echo -e "${BLUE}🏗️  Architecture Design Framework / 架构设计框架${NC}"
echo ""
echo "This skill will guide you through: / 本技能将引导你完成："
echo "  1. System Overview / 系统概览"
echo "  2. Component Design / 组件设计"
echo "  3. Data Flow / 数据流"
echo "  4. API Design / API 设计"
echo "  5. Database Schema / 数据库模式"
echo "  6. Technology Stack / 技术栈"
echo ""

# Check if using ACP
if [ "$USE_ACP" = "true" ] && [ -n "$ACP_AGENT" ]; then
    echo -e "${GREEN}🤖 Using ACP agent: $ACP_AGENT / 使用 ACP 代理: $ACP_AGENT${NC}"
    echo "The design will be enhanced by $ACP_AGENT / 设计将由 $ACP_AGENT 增强"
    echo ""
fi

# Prompt user for input
echo -e "${YELLOW}💡 Describe your system requirements / 描述你的系统需求:${NC}"
echo "   (What are the main features? Scale? Constraints?)"
echo "   （主要功能是什么？规模？约束条件？）"
echo ""
echo "   Type your requirements and press Ctrl+D when done:"
echo "   输入你的需求，完成后按 Ctrl+D："
echo ""

# Read user input
USER_REQUIREMENTS=$(cat)

# Generate output
echo ""
echo -e "${BLUE}📝 Generating architecture design document... / 生成架构设计文档...${NC}"

cat > "$OUTPUT_FILE" << EOF
# Architecture Design Document / 架构设计文档

**Date / 日期**: ${DATE}  
**Project / 项目**: $(basename "$(pwd)")  
**Skill / 技能**: /design  
**ACP Agent / ACP 代理**: ${ACP_AGENT:-"None / 无"}

---

## 1. Executive Summary / 执行摘要

### Project Overview / 项目概览
${USER_REQUIREMENTS}

### Design Goals / 设计目标
- [ ] Scalability / 可扩展性
- [ ] Maintainability / 可维护性
- [ ] Performance / 性能
- [ ] Security / 安全性
- [ ] Reliability / 可靠性

---

## 2. System Architecture / 系统架构

### 2.1 High-Level Architecture / 高层架构

\`\`\`
┌─────────────────────────────────────────────────────────────┐
│                        Client Layer                        │
│         (Web App / Mobile App / CLI / API Clients)         │
└──────────────────────────┬──────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────┐
│                      API Gateway Layer                      │
│              (Authentication / Rate Limiting)               │
└──────────────────────────┬──────────────────────────────────┘
                           │
           ┌───────────────┼───────────────┐
           ▼               ▼               ▼
┌──────────────┐  ┌──────────────┐  ┌──────────────┐
│   Service A  │  │   Service B  │  │   Service C  │
│  (Feature 1) │  │  (Feature 2) │  │  (Feature 3) │
└──────┬───────┘  └──────┬───────┘  └──────┬───────┘
       │                 │                 │
       └────────────┬────┴─────────────────┘
                    │
                    ▼
┌─────────────────────────────────────────────────────────────┐
│                      Data Layer                            │
│              (Database / Cache / Message Queue)             │
└─────────────────────────────────────────────────────────────┘
\`\`\`

### 2.2 Component Diagram / 组件图

| Component / 组件 | Responsibility / 职责 | Technology / 技术 |
|-----------------|---------------------|------------------|
| [Component 1] | [Description] | [Tech Stack] |
| [Component 2] | [Description] | [Tech Stack] |
| [Component 3] | [Description] | [Tech Stack] |

---

## 3. Data Flow / 数据流

### 3.1 Request Flow / 请求流

1. **Client** sends request / 客户端发送请求
2. **API Gateway** validates & routes / API 网关验证和路由
3. **Service** processes business logic / 服务处理业务逻辑
4. **Database** stores/retrieves data / 数据库存储/检索数据
5. **Response** returns to client / 响应返回客户端

### 3.2 Data Flow Diagram / 数据流图

\`\`\`
[User] → [API Gateway] → [Service] → [Database]
            ↓
        [Cache] ← [Message Queue] ← [Background Worker]
\`\`\`

---

## 4. API Design / API 设计

### 4.1 RESTful Endpoints / RESTful 端点

| Method | Endpoint | Description | Auth |
|--------|----------|-------------|------|
| GET | /api/v1/resource | List resources | Yes |
| POST | /api/v1/resource | Create resource | Yes |
| GET | /api/v1/resource/:id | Get resource | Yes |
| PUT | /api/v1/resource/:id | Update resource | Yes |
| DELETE | /api/v1/resource/:id | Delete resource | Yes |

### 4.2 Request/Response Examples / 请求/响应示例

\`\`\`json
// POST /api/v1/resource
// Request
{
  "name": "Example",
  "description": "Description here"
}

// Response 201
{
  "id": "uuid",
  "name": "Example",
  "description": "Description here",
  "createdAt": "2026-03-24T10:00:00Z"
}
\`\`\`

---

## 5. Database Schema / 数据库模式

### 5.1 Entity Relationship Diagram / 实体关系图

\`\`\`
┌──────────────┐       ┌──────────────┐       ┌──────────────┐
│    User      │       │    Order     │       │   Product    │
├──────────────┤       ├──────────────┤       ├──────────────┤
│ id (PK)      │──┐    │ id (PK)      │    ┌──│ id (PK)      │
│ email        │  │    │ user_id (FK) │────┘  │ name         │
│ name         │  └───>│ product_id   │──────>│ price        │
│ created_at   │       │ quantity     │       │ stock        │
└──────────────┘       │ created_at   │       └──────────────┘
                       └──────────────┘
\`\`\`

### 5.2 Table Definitions / 表定义

\`\`\`sql
-- Users Table / 用户表
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Add more tables as needed / 根据需要添加更多表
\`\`\`

---

## 6. Technology Stack / 技术栈

### 6.1 Backend / 后端
- **Language**: [Go / Node.js / Python / Java]
- **Framework**: [Gin / Express / FastAPI / Spring]
- **Database**: [PostgreSQL / MySQL / MongoDB]
- **Cache**: [Redis / Memcached]
- **Message Queue**: [RabbitMQ / Kafka / Redis]

### 6.2 Frontend / 前端
- **Framework**: [React / Vue / Angular]
- **State Management**: [Redux / Vuex / Context API]
- **UI Library**: [Material-UI / Ant Design / Tailwind]

### 6.3 Infrastructure / 基础设施
- **Container**: Docker
- **Orchestration**: Kubernetes / Docker Compose
- **CI/CD**: GitHub Actions / GitLab CI
- **Monitoring**: Prometheus / Grafana

---

## 7. Non-Functional Requirements / 非功能性需求

### 7.1 Performance / 性能
- Response time < 200ms (p95) / 响应时间 < 200ms (p95)
- Support 1000+ concurrent users / 支持 1000+ 并发用户
- Database queries < 50ms / 数据库查询 < 50ms

### 7.2 Security / 安全
- HTTPS everywhere / 全站 HTTPS
- JWT authentication / JWT 认证
- Input validation / 输入验证
- SQL injection prevention / SQL 注入防护

### 7.3 Scalability / 可扩展性
- Horizontal scaling supported / 支持水平扩展
- Stateless services / 无状态服务
- Database sharding ready / 数据库分片就绪

---

## 8. Implementation Phases / 实现阶段

### Phase 1: MVP (Week 1-2) / 阶段 1: MVP
- [ ] Core API endpoints / 核心 API 端点
- [ ] Basic database schema / 基础数据库模式
- [ ] Authentication / 认证

### Phase 2: Core Features (Week 3-4) / 阶段 2: 核心功能
- [ ] Complete CRUD operations / 完整 CRUD 操作
- [ ] Integration tests / 集成测试
- [ ] Documentation / 文档

### Phase 3: Production Ready (Week 5-6) / 阶段 3: 生产就绪
- [ ] Performance optimization / 性能优化
- [ ] Security audit / 安全审计
- [ ] Monitoring setup / 监控设置

---

## 9. Risks & Mitigation / 风险与缓解

| Risk / 风险 | Impact / 影响 | Mitigation / 缓解措施 |
|------------|--------------|---------------------|
| [Risk 1] | High/Med/Low | [Mitigation strategy] |
| [Risk 2] | High/Med/Low | [Mitigation strategy] |

---

## 10. Next Steps / 下一步

- [ ] Review design with team / 与团队审查设计
- [ ] Create detailed tasks / 创建详细任务
- [ ] Set up development environment / 设置开发环境
- [ ] Run /code to start implementation / 运行 /code 开始实现
- [ ] Run /test for test planning / 运行 /test 进行测试规划

---

*Generated by DragonStack /design skill / 由龙栈 /design 技能生成*
EOF

echo ""
echo -e "${GREEN}✅ Architecture design document created! / 架构设计文档已创建！${NC}"
echo ""
echo "📄 Output file / 输出文件: ${OUTPUT_FILE}"
echo ""

if [ "$USE_ACP" = "true" ]; then
    echo -e "${BLUE}🤖 ACP Integration Note / ACP 集成说明:${NC}"
    echo "   This design document can be enhanced by running:"
    echo "   可以通过运行以下命令增强此设计文档:"
    echo ""
    echo "   /acp spawn $ACP_AGENT --mode oneshot"
    echo "   'Review and enhance this architecture design'"
    echo ""
fi

echo -e "${YELLOW}📋 Next steps / 下一步:${NC}"
echo "   1. Fill in the architecture details / 填写架构细节"
echo "   2. Review with your team / 与团队审查"
echo "   3. Create database migrations / 创建数据库迁移"
echo "   4. Run /code to start implementation / 运行 /code 开始实现"
echo ""
echo "🏗️  Happy designing! / 设计愉快！"
