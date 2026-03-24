#!/bin/bash
# Doc Skill Script / 文档生成技能脚本
# Copyright (c) 2026 OASYS CORE INTERNATIONAL LIMITED / 潤芯國際(香港)有限公司

set -e

echo "📚 DragonStack Doc Skill / 文档技能"
echo "===================================="
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
DOC_TYPE="api"

while [[ $# -gt 0 ]]; do
    case $1 in
        --api)
            DOC_TYPE="api"
            shift
            ;;
        --readme)
            DOC_TYPE="readme"
            shift
            ;;
        --changelog)
            DOC_TYPE="changelog"
            shift
            ;;
        --help)
            echo "Usage: ./dragonstack doc [options]"
            echo ""
            echo "Options:"
            echo "  --api         Generate API documentation (default)"
            echo "  --readme      Generate/update README"
            echo "  --changelog   Generate changelog"
            echo "  --help        Show this help"
            exit 0
            ;;
        *)
            shift
            ;;
    esac
done

# Create directories
mkdir -p docs
mkdir -p docs/api

# Get current date
DATE=$(date +%Y-%m-%d)

echo -e "${BLUE}📚 Documentation Generator / 文档生成器${NC}"
echo ""
echo "Document Type / 文档类型: ${DOC_TYPE}"
echo ""

case $DOC_TYPE in
    api)
        OUTPUT_FILE="docs/api/README.md"
        echo -e "${BLUE}📝 Generating API documentation... / 生成 API 文档...${NC}"
        
        cat > "$OUTPUT_FILE" << EOF
# API Documentation / API 文档

**Project / 项目**: $(basename "$(pwd)")  
**Version / 版本**: 1.0.0  
**Last Updated / 最后更新**: ${DATE}

---

## Table of Contents / 目录

- [Overview / 概览](#overview--概览)
- [Authentication / 认证](#authentication--认证)
- [Endpoints / 端点](#endpoints--端点)
- [Error Handling / 错误处理](#error-handling--错误处理)
- [Rate Limiting / 速率限制](#rate-limiting--速率限制)

---

## Overview / 概览

Base URL / 基础 URL:
\`\`\`
https://api.example.com/v1
\`\`\`

Content-Type / 内容类型:
\`\`\`
application/json
\`\`\`

---

## Authentication / 认证

All API requests require authentication / 所有 API 请求都需要认证。

### API Key / API 密钥

Include the API key in the header / 在头部包含 API 密钥：

\`\`\`http
Authorization: Bearer YOUR_API_KEY
\`\`\`

---

## Endpoints / 端点

### [Resource Name / 资源名称]

#### List [Resources] / 列出[资源]

\`\`\`http
GET /api/v1/resources
\`\`\`

**Parameters / 参数**:

| Name / 名称 | Type / 类型 | Required / 必需 | Description / 描述 |
|------------|------------|----------------|-------------------|
| page | integer | No | Page number / 页码 |
| limit | integer | No | Items per page / 每页项目数 |
| sort | string | No | Sort field / 排序字段 |

**Response / 响应**:

\`\`\`json
{
  "data": [
    {
      "id": "uuid",
      "name": "Resource Name",
      "created_at": "2026-03-24T10:00:00Z"
    }
  ],
  "meta": {
    "page": 1,
    "limit": 20,
    "total": 100
  }
}
\`\`\`

#### Get [Resource] / 获取[资源]

\`\`\`http
GET /api/v1/resources/{id}
\`\`\`

**Parameters / 参数**:

| Name / 名称 | Type / 类型 | Required / 必需 | Description / 描述 |
|------------|------------|----------------|-------------------|
| id | string | Yes | Resource ID / 资源 ID |

**Response / 响应**:

\`\`\`json
{
  "id": "uuid",
  "name": "Resource Name",
  "description": "Resource description",
  "created_at": "2026-03-24T10:00:00Z",
  "updated_at": "2026-03-24T10:00:00Z"
}
\`\`\`

#### Create [Resource] / 创建[资源]

\`\`\`http
POST /api/v1/resources
\`\`\`

**Request Body / 请求体**:

\`\`\`json
{
  "name": "New Resource",
  "description": "Resource description"
}
\`\`\`

**Response / 响应**:

\`\`\`json
{
  "id": "uuid",
  "name": "New Resource",
  "description": "Resource description",
  "created_at": "2026-03-24T10:00:00Z"
}
\`\`\`

#### Update [Resource] / 更新[资源]

\`\`\`http
PUT /api/v1/resources/{id}
\`\`\`

**Request Body / 请求体**:

\`\`\`json
{
  "name": "Updated Name",
  "description": "Updated description"
}
\`\`\`

#### Delete [Resource] / 删除[资源]

\`\`\`http
DELETE /api/v1/resources/{id}
\`\`\`

**Response / 响应**:

\`\`\`json
{
  "message": "Resource deleted successfully"
}
\`\`\`

---

## Error Handling / 错误处理

### Error Response Format / 错误响应格式

\`\`\`json
{
  "error": {
    "code": "ERROR_CODE",
    "message": "Human-readable error message",
    "details": {}
  }
}
\`\`\`

### Error Codes / 错误代码

| Code / 代码 | HTTP Status / HTTP 状态 | Description / 描述 |
|------------|------------------------|-------------------|
| INVALID_REQUEST | 400 | Invalid request format / 无效请求格式 |
| UNAUTHORIZED | 401 | Authentication required / 需要认证 |
| FORBIDDEN | 403 | Permission denied / 权限拒绝 |
| NOT_FOUND | 404 | Resource not found / 资源未找到 |
| RATE_LIMITED | 429 | Too many requests / 请求过多 |
| SERVER_ERROR | 500 | Internal server error / 内部服务器错误 |

---

## Rate Limiting / 速率限制

API requests are limited to / API 请求限制为：

- 1000 requests per hour / 每小时 1000 个请求
- 100 requests per minute / 每分钟 100 个请求

Rate limit headers are included in responses / 速率限制头部包含在响应中：

\`\`\`http
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 999
X-RateLimit-Reset: 1648123456
\`\`\`

---

*Generated by DragonStack /doc skill / 由龙栈 /doc 技能生成*
EOF
        ;;
        
    readme)
        OUTPUT_FILE="README.md"
        echo -e "${BLUE}📝 Generating README... / 生成 README...${NC}"
        
        cat > "$OUTPUT_FILE" << EOF
# $(basename "$(pwd)")

[![DragonStack](https://img.shields.io/badge/Built%20with-DragonStack-orange)](https://github.com/OasysCore/DragonStack-)

> Short project description / 简短项目描述

---

## 📋 Table of Contents / 目录

- [Overview / 概览](#overview--概览)
- [Features / 功能](#features--功能)
- [Installation / 安装](#installation--安装)
- [Usage / 使用](#usage--使用)
- [API Documentation / API 文档](#api-documentation--api-文档)
- [Development / 开发](#development--开发)
- [License / 许可证](#license--许可证)

---

## Overview / 概览

Describe what this project does and why it exists.
描述这个项目做什么以及为什么存在。

### Key Features / 关键功能

- ✅ Feature 1 / 功能 1
- ✅ Feature 2 / 功能 2
- ✅ Feature 3 / 功能 3

---

## Installation / 安装

### Prerequisites / 前提条件

- [List prerequisites / 列出前提条件]

### Setup / 设置

\`\`\`bash
# Clone the repository / 克隆仓库
git clone https://github.com/username/repo.git
cd repo

# Install dependencies / 安装依赖
[installation commands]

# Configure environment / 配置环境
cp .env.example .env
# Edit .env with your settings / 用您的设置编辑 .env
\`\`\`

---

## Usage / 使用

### Quick Start / 快速开始

\`\`\`bash
# Start the application / 启动应用
[start commands]
\`\`\`

### Examples / 示例

\`\`\`bash
# Example 1 / 示例 1
[command]

# Example 2 / 示例 2
[command]
\`\`\`

---

## API Documentation / API 文档

See [docs/api/README.md](docs/api/README.md) for detailed API documentation.
详细的 API 文档请参见 [docs/api/README.md](docs/api/README.md)。

---

## Development / 开发

### Project Structure / 项目结构

\`\`\`
.
├── src/              # Source code / 源代码
├── tests/            # Test files / 测试文件
├── docs/             # Documentation / 文档
├── scripts/          # Utility scripts / 实用脚本
└── README.md         # This file / 本文件
\`\`\`

### Running Tests / 运行测试

\`\`\`bash
# Run all tests / 运行所有测试
./dragonstack test

# Run with coverage / 带覆盖率运行
./dragonstack test --coverage
\`\`\`

### Code Style / 代码风格

\`\`\`bash
# Run linter / 运行 linter
[linter command]

# Format code / 格式化代码
[formatter command]
\`\`\`

---

## License / 许可证

[Your License / 您的许可证]

---

Built with ❤️ using [DragonStack](https://github.com/OasysCore/DragonStack-)

*Generated by DragonStack /doc skill / 由龙栈 /doc 技能生成*
EOF
        ;;
        
    changelog)
        OUTPUT_FILE="CHANGELOG.md"
        echo -e "${BLUE}📝 Generating changelog... / 生成变更日志...${NC}"
        
        cat > "$OUTPUT_FILE" << EOF
# Changelog / 变更日志

All notable changes to this project will be documented in this file.
此项目的所有显著变更都将记录在此文件中。

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased / 未发布]

### Added / 新增
- New features / 新功能

### Changed / 变更
- Changes in existing functionality / 现有功能的变更

### Deprecated / 弃用
- Soon-to-be removed features / 即将删除的功能

### Removed / 删除
- Now removed features / 现已删除的功能

### Fixed / 修复
- Bug fixes / Bug 修复

### Security / 安全
- Security improvements / 安全改进

---

## [1.0.0] - ${DATE}

### Added / 新增
- Initial release / 初始版本
- Core functionality / 核心功能
- API endpoints / API 端点
- Documentation / 文档

---

## Template / 模板

\`\`\`
## [Version] - YYYY-MM-DD

### Added / 新增
- 

### Changed / 变更
- 

### Deprecated / 弃用
- 

### Removed / 删除
- 

### Fixed / 修复
- 

### Security / 安全
- 
\`\`\`

---

*Generated by DragonStack /doc skill / 由龙栈 /doc 技能生成*
EOF
        ;;
esac

echo ""
echo -e "${GREEN}✅ Documentation created! / 文档已创建！${NC}"
echo ""
echo "📄 Output file / 输出文件: ${OUTPUT_FILE}"
echo ""
echo -e "${YELLOW}📋 Next steps / 下一步:${NC}"
echo "   1. Review and customize the documentation / 审查和自定义文档"
echo "   2. Add specific details about your project / 添加项目的具体细节"
echo "   3. Update examples with real usage / 用真实使用更新示例"
echo "   4. Run /ship to commit documentation / 运行 /ship 提交文档"
echo ""
echo "📚 Happy documenting! / 文档编写愉快！"
