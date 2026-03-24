#!/bin/bash
# Test Skill Script / 测试技能脚本
# Copyright (c) 2026 OASYS CORE INTERNATIONAL LIMITED / 潤芯國際(香港)有限公司

set -e

echo "🧪 DragonStack Test Skill / 测试技能"
echo "======================================"
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
TEST_TYPE="all"
COVERAGE="false"

while [[ $# -gt 0 ]]; do
    case $1 in
        --unit)
            TEST_TYPE="unit"
            shift
            ;;
        --integration)
            TEST_TYPE="integration"
            shift
            ;;
        --e2e)
            TEST_TYPE="e2e"
            shift
            ;;
        --coverage)
            COVERAGE="true"
            shift
            ;;
        --help)
            echo "Usage: ./dragonstack test [options]"
            echo ""
            echo "Options:"
            echo "  --unit         Run unit tests only"
            echo "  --integration  Run integration tests only"
            echo "  --e2e          Run end-to-end tests only"
            echo "  --coverage     Generate coverage report"
            echo "  --help         Show this help"
            exit 0
            ;;
        *)
            shift
            ;;
    esac
done

# Create directories
mkdir -p tests
mkdir -p tests/unit
mkdir -p tests/integration
mkdir -p tests/e2e
mkdir -p docs

# Get current date
DATE=$(date +%Y-%m-%d)
OUTPUT_FILE="docs/test-plan-${DATE}.md"

echo -e "${BLUE}🧪 Test Planning Framework / 测试规划框架${NC}"
echo ""
echo "Test Type / 测试类型: ${TEST_TYPE}"
if [ "$COVERAGE" = "true" ]; then
    echo "Coverage Report / 覆盖率报告: Enabled / 启用"
fi
echo ""

# Detect project type
if [ -f "go.mod" ]; then
    PROJECT_TYPE="go"
    TEST_CMD="go test ./..."
    COVERAGE_CMD="go test -coverprofile=coverage.out ./... && go tool cover -html=coverage.out -o coverage.html"
elif [ -f "package.json" ]; then
    PROJECT_TYPE="nodejs"
    TEST_CMD="npm test"
    COVERAGE_CMD="npm run test:coverage"
elif [ -f "requirements.txt" ] || [ -f "pyproject.toml" ]; then
    PROJECT_TYPE="python"
    TEST_CMD="pytest"
    COVERAGE_CMD="pytest --cov=src --cov-report=html"
elif [ -f "Cargo.toml" ]; then
    PROJECT_TYPE="rust"
    TEST_CMD="cargo test"
    COVERAGE_CMD="cargo tarpaulin --out Html"
else
    PROJECT_TYPE="unknown"
    TEST_CMD="[custom test command]"
    COVERAGE_CMD="[custom coverage command]"
fi

echo -e "${BLUE}📋 Project Type Detected / 检测到的项目类型: ${PROJECT_TYPE}${NC}"
echo ""

# Prompt user for input
echo -e "${YELLOW}💡 Describe what needs to be tested / 描述需要测试的内容:${NC}"
echo "   (Key features, critical paths, edge cases)"
echo "   （关键功能、关键路径、边界情况）"
echo ""
echo "   Type your testing requirements and press Ctrl+D when done:"
echo "   输入你的测试需求，完成后按 Ctrl+D："
echo ""

# Read user input
USER_REQUIREMENTS=$(cat)

# Generate test plan
echo ""
echo -e "${BLUE}📝 Generating test plan... / 生成测试计划...${NC}"

cat > "$OUTPUT_FILE" << EOF
# Test Plan / 测试计划

**Date / 日期**: ${DATE}  
**Project / 项目**: $(basename "$(pwd)")  
**Skill / 技能**: /test  
**Project Type / 项目类型**: ${PROJECT_TYPE}  
**Test Type / 测试类型**: ${TEST_TYPE}  
**Coverage / 覆盖率**: ${COVERAGE}

---

## 1. Testing Requirements / 测试需求

${USER_REQUIREMENTS}

---

## 2. Test Strategy / 测试策略

### 2.1 Test Pyramid / 测试金字塔

\`\`\`
        /\
       /  \
      / E2E \      <- Few tests, high confidence
     /________\
    /          \
   / Integration \  <- Medium tests, service boundaries
  /______________\
 /                \
/     Unit Tests    \ <- Many tests, fast feedback
/____________________\
\`\`\`

### 2.2 Test Commands / 测试命令

| Type / 类型 | Command / 命令 |
|------------|---------------|
| Unit Tests / 单元测试 | \`${TEST_CMD}\` |
| Coverage / 覆盖率 | \`${COVERAGE_CMD}\` |

---

## 3. Test Cases / 测试用例

### 3.1 Unit Tests / 单元测试

#### [Feature/Module Name / 功能/模块名称]

| Test Case / 测试用例 | Input / 输入 | Expected Output / 期望输出 | Status / 状态 |
|---------------------|-------------|---------------------------|--------------|
| [Test 1] | [input] | [output] | ⏳ Pending |
| [Test 2] | [input] | [output] | ⏳ Pending |
| [Test 3] | [input] | [output] | ⏳ Pending |

#### Edge Cases / 边界情况

| Test Case / 测试用例 | Description / 描述 | Status / 状态 |
|---------------------|-------------------|--------------|
| Empty input / 空输入 | Test with empty string/null | ⏳ Pending |
| Large input / 大输入 | Test with maximum size data | ⏳ Pending |
| Invalid format / 无效格式 | Test with malformed input | ⏳ Pending |
| Concurrent access / 并发访问 | Test thread safety | ⏳ Pending |

### 3.2 Integration Tests / 集成测试

| Test Case / 测试用例 | Components / 组件 | Description / 描述 | Status / 状态 |
|---------------------|------------------|-------------------|--------------|
| [Integration Test 1] | [A + B] | [Description] | ⏳ Pending |
| [Integration Test 2] | [B + C] | [Description] | ⏳ Pending |

### 3.3 E2E Tests / 端到端测试

| Test Case / 测试用例 | User Flow / 用户流程 | Description / 描述 | Status / 状态 |
|---------------------|---------------------|-------------------|--------------|
| [E2E Test 1] | [Flow 1] | [Description] | ⏳ Pending |
| [E2E Test 2] | [Flow 2] | [Description] | ⏳ Pending |

---

## 4. Test Implementation / 测试实现

### 4.1 Test File Structure / 测试文件结构

\`\`\`
tests/
├── unit/
│   ├── __init__.py
│   ├── test_feature1.py
│   └── test_feature2.py
├── integration/
│   ├── __init__.py
│   ├── test_api.py
│   └── test_database.py
├── e2e/
│   ├── __init__.py
│   ├── test_user_flow.py
│   └── test_checkout.py
├── fixtures/
│   └── test_data.json
└── conftest.py
\`\`\`

### 4.2 Test Templates / 测试模板

EOF

# Add language-specific test templates
case $PROJECT_TYPE in
    go)
        cat >> "$OUTPUT_FILE" << 'EOF'
#### Go Unit Test Template / Go 单元测试模板

```go
package yourpackage

import (
    "testing"
    "github.com/stretchr/testify/assert"
)

func TestFunctionName(t *testing.T) {
    // Arrange / 准备
    input := "test input"
    expected := "expected output"
    
    // Act / 执行
    result, err := FunctionName(input)
    
    // Assert / 验证
    assert.NoError(t, err)
    assert.Equal(t, expected, result)
}

func TestFunctionName_TableDriven(t *testing.T) {
    tests := []struct {
        name     string
        input    string
        expected string
        wantErr  bool
    }{
        {
            name:     "valid input",
            input:    "valid",
            expected: "result",
            wantErr:  false,
        },
        {
            name:     "invalid input",
            input:    "",
            expected: "",
            wantErr:  true,
        },
    }
    
    for _, tt := range tests {
        t.Run(tt.name, func(t *testing.T) {
            result, err := FunctionName(tt.input)
            if tt.wantErr {
                assert.Error(t, err)
            } else {
                assert.NoError(t, err)
                assert.Equal(t, tt.expected, result)
            }
        })
    }
}
```

#### Go Integration Test Template / Go 集成测试模板

```go
package integration

import (
    "testing"
    "github.com/stretchr/testify/suite"
)

type IntegrationTestSuite struct {
    suite.Suite
    db *sql.DB
}

func (s *IntegrationTestSuite) SetupSuite() {
    // Setup test database / 设置测试数据库
}

func (s *IntegrationTestSuite) TearDownSuite() {
    // Cleanup / 清理
}

func (s *IntegrationTestSuite) TestAPIEndpoint() {
    // Test API endpoint / 测试 API 端点
}

func TestIntegrationSuite(t *testing.T) {
    suite.Run(t, new(IntegrationTestSuite))
}
```
EOF
        ;;
    python)
        cat >> "$OUTPUT_FILE" << 'EOF'
#### Python Unit Test Template / Python 单元测试模板

```python
import pytest
from unittest.mock import Mock, patch
from your_module import YourClass


class TestYourClass:
    """Test suite for YourClass"""
    
    @pytest.fixture
    def instance(self):
        """Create test instance"""
        return YourClass(config={"key": "value"})
    
    def test_method_success(self, instance):
        """Test method with valid input"""
        # Arrange
        input_data = "valid input"
        
        # Act
        result = instance.method(input_data)
        
        # Assert
        assert result is not None
        assert result.status == "success"
    
    def test_method_error(self, instance):
        """Test method error handling"""
        # Arrange
        invalid_input = None
        
        # Act & Assert
        with pytest.raises(ValueError, match="Invalid input"):
            instance.method(invalid_input)
    
    @patch('your_module.external_api')
    def test_method_with_mock(self, mock_api, instance):
        """Test with mocked external API"""
        # Arrange
        mock_api.return_value = {"status": "ok"}
        
        # Act
        result = instance.method("input")
        
        # Assert
        mock_api.assert_called_once()
        assert result["status"] == "ok"
```

#### Python Integration Test Template / Python 集成测试模板

```python
import pytest
from fastapi.testclient import TestClient
from your_app import app


@pytest.fixture
def client():
    """Create test client"""
    return TestClient(app)


class TestAPIEndpoints:
    """Integration tests for API endpoints"""
    
    def test_create_resource(self, client):
        """Test POST /api/resource"""
        response = client.post(
            "/api/resource",
            json={"name": "test", "value": 123}
        )
        assert response.status_code == 201
        assert response.json()["name"] == "test"
    
    def test_get_resource(self, client):
        """Test GET /api/resource/{id}"""
        response = client.get("/api/resource/123")
        assert response.status_code == 200
```
EOF
        ;;
    nodejs)
        cat >> "$OUTPUT_FILE" << 'EOF'
#### JavaScript/TypeScript Unit Test Template / JS/TS 单元测试模板

```typescript
import { describe, it, expect, beforeEach, jest } from '@jest/globals';
import { YourService } from './your-service';

describe('YourService', () => {
  let service: YourService;
  
  beforeEach(() => {
    service = new YourService();
  });
  
  describe('methodName', () => {
    it('should return correct result for valid input', () => {
      // Arrange
      const input = 'valid input';
      
      // Act
      const result = service.methodName(input);
      
      // Assert
      expect(result).toBe('expected output');
    });
    
    it('should throw error for invalid input', () => {
      // Arrange
      const input = null;
      
      // Act & Assert
      expect(() => service.methodName(input)).toThrow('Invalid input');
    });
  });
});
```

#### Jest Mock Example / Jest Mock 示例

```typescript
import { jest } from '@jest/globals';

// Mock external dependency / Mock 外部依赖
jest.mock('./external-api', () => ({
  fetchData: jest.fn().mockResolvedValue({ status: 'ok' })
}));

it('should handle external API call', async () => {
  const result = await service.callExternalAPI();
  expect(result).toEqual({ status: 'ok' });
});
```
EOF
        ;;
    *)
        cat >> "$OUTPUT_FILE" << 'EOF'
#### Generic Test Template / 通用测试模板

```
[Test Framework Setup]

1. Unit Test Structure / 单元测试结构:
   - Setup / 准备
   - Execute / 执行
   - Assert / 验证
   - Cleanup / 清理

2. Test Cases to Cover / 需要覆盖的测试用例:
   - Happy path / 正常路径
   - Error cases / 错误情况
   - Edge cases / 边界情况
   - Null/empty inputs / 空输入
   - Large inputs / 大输入
   - Concurrent access / 并发访问
```
EOF
        ;;
esac

cat >> "$OUTPUT_FILE" << EOF

---

## 5. Running Tests / 运行测试

### 5.1 Run All Tests / 运行所有测试

\`\`\`bash
${TEST_CMD}
\`\`\`

### 5.2 Run with Coverage / 带覆盖率运行

\`\`\`bash
${COVERAGE_CMD}
\`\`\`

### 5.3 Run Specific Test / 运行特定测试

\`\`\`bash
# Unit tests only / 仅单元测试
./dragonstack test --unit

# Integration tests only / 仅集成测试
./dragonstack test --integration

# E2E tests only / 仅端到端测试
./dragonstack test --e2e

# With coverage / 带覆盖率
./dragonstack test --coverage
\`\`\`

---

## 6. Coverage Goals / 覆盖率目标

| Metric / 指标 | Target / 目标 | Current / 当前 |
|--------------|--------------|---------------|
| Line Coverage / 行覆盖率 | 80% | 0% |
| Branch Coverage / 分支覆盖率 | 70% | 0% |
| Function Coverage / 函数覆盖率 | 90% | 0% |

---

## 7. CI/CD Integration / CI/CD 集成

### GitHub Actions Example / GitHub Actions 示例

\`\`\`yaml
name: Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup environment / 设置环境
        uses: actions/setup-${PROJECT_TYPE}@v3
        
      - name: Install dependencies / 安装依赖
        run: ${PROJECT_TYPE == "nodejs" && "npm ci" || PROJECT_TYPE == "python" && "pip install -r requirements.txt" || PROJECT_TYPE == "go" && "go mod download" || "echo 'Setup dependencies'"}
        
      - name: Run tests / 运行测试
        run: ${TEST_CMD}
        
      - name: Generate coverage / 生成覆盖率
        run: ${COVERAGE_CMD}
        
      - name: Upload coverage / 上传覆盖率
        uses: codecov/codecov-action@v3
\`\`\`

---

## 8. Action Items / 行动项

- [ ] Create test directory structure / 创建测试目录结构
- [ ] Write unit tests for core functions / 为核心函数编写单元测试
- [ ] Write integration tests for API / 为 API 编写集成测试
- [ ] Write E2E tests for critical flows / 为关键流程编写端到端测试
- [ ] Set up CI/CD pipeline / 设置 CI/CD 流水线
- [ ] Achieve coverage targets / 达到覆盖率目标
- [ ] Run /code-review on test code / 对测试代码运行 /code-review

---

*Generated by DragonStack /test skill / 由龙栈 /test 技能生成*
EOF

echo ""
echo -e "${GREEN}✅ Test plan created! / 测试计划已创建！${NC}"
echo ""
echo "📄 Output file / 输出文件: ${OUTPUT_FILE}"
echo ""
echo -e "${YELLOW}📋 Next steps / 下一步:${NC}"
echo "   1. Review the test plan / 审查测试计划"
echo "   2. Create test files based on templates / 基于模板创建测试文件"
echo "   3. Implement test cases / 实现测试用例"
echo "   4. Run tests: ${TEST_CMD}"
if [ "$COVERAGE" = "true" ]; then
    echo "   5. Check coverage: ${COVERAGE_CMD}"
fi
echo ""
echo "🧪 Happy testing! / 测试愉快！"
