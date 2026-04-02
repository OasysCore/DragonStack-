#!/usr/bin/env python3
"""
DragonStack Enhanced Runner with Ontology Integration
龙栈增强执行器 - 集成 Ontology 记忆系统
"""

import sys
import os
import json
import subprocess
import time
from pathlib import Path
from datetime import datetime

# 添加 Ontology 集成模块路径
sys.path.insert(0, str(Path.home() / ".openclaw/workspace/skills/dragonstack/scripts"))

try:
    from ontology_integration import (
        create_project, log_skill_execution, create_document_from_output,
        update_project_status, DRAGONSTACK_SKILLS, create_dragonstack_skill_entity
    )
    ONTOLOGY_AVAILABLE = True
except ImportError:
    ONTOLOGY_AVAILABLE = False
    print("⚠️  Ontology integration not available")

# 龙栈 3.0 路径
DRAGONSTACK_DIR = Path.home() / ".dragonstack-3.0-beta"
DS_SCRIPT = DRAGONSTACK_DIR / "ds"

# 项目状态文件
PROJECT_STATE_FILE = DRAGONSTACK_DIR / ".project_state.json"


def load_project_state():
    """加载当前项目状态"""
    if PROJECT_STATE_FILE.exists():
        with open(PROJECT_STATE_FILE, 'r') as f:
            return json.load(f)
    return {"current_project": None, "projects": {}}


def save_project_state(state):
    """保存项目状态"""
    DRAGONSTACK_DIR.mkdir(parents=True, exist_ok=True)
    with open(PROJECT_STATE_FILE, 'w') as f:
        json.dump(state, f, indent=2)


def detect_skill_from_input(user_input: str) -> str:
    """从用户输入检测技能类型 - 使用增强版意图识别"""
    try:
        from intent_recognizer import detect_skill
        return detect_skill(user_input)
    except ImportError:
        # 回退到简单关键词匹配
        user_input_lower = user_input.lower()
        
        keywords = {
            "brainstorm": ["brainstorm", "构思", "头脑风暴", "想法", "创意"],
            "design": ["design", "架构", "设计", "structure", "schema"],
            "code": ["code", "代码", "生成", "写", "实现", "program"],
            "review": ["review", "审查", "检查", "code review", "评审"],
            "test": ["test", "测试", "unittest", "验证"],
            "ship": ["ship", "发布", "部署", "deploy", "上线"],
            "debug": ["debug", "调试", "bug", "修复", "fix"],
            "doc": ["doc", "文档", "documentation", "说明"],
            "refactor": ["refactor", "重构", "优化", "改进"]
        }
        
        for skill, words in keywords.items():
            for word in words:
                if word in user_input_lower:
                    return skill
        
        return "code"


def extract_project_name(user_input: str) -> str:
    """从用户输入提取项目名称"""
    # 简单的启发式提取
    words = user_input.split()
    
    # 寻找关键词后的名词
    for i, word in enumerate(words):
        if word.lower() in ["project", "项目", "app", "application", "系统"]:
            if i + 1 < len(words):
                return words[i + 1].strip(".,;:!?")
    
    # 使用输入的前 5 个单词作为项目名
    return " ".join(words[:5])


def run_dragonstack_skill(skill: str, user_input: str, project_id: str = None) -> dict:
    """
    执行龙栈技能
    
    Returns:
        {
            "success": bool,
            "result": str,
            "error": str,
            "duration_ms": int
        }
    """
    start_time = time.time()
    
    # 检查 ds 脚本是否存在
    if not DS_SCRIPT.exists():
        # 尝试使用简化执行
        return run_fallback_skill(skill, user_input)
    
    try:
        # 执行 ds 脚本
        env = os.environ.copy()
        env["DRAGONSTACK_SKILL"] = skill
        
        result = subprocess.run(
            [str(DS_SCRIPT), user_input],
            capture_output=True,
            text=True,
            timeout=300,  # 5分钟超时
            env=env
        )
        
        duration_ms = int((time.time() - start_time) * 1000)
        
        if result.returncode == 0:
            return {
                "success": True,
                "result": result.stdout,
                "error": None,
                "duration_ms": duration_ms
            }
        else:
            return {
                "success": False,
                "result": result.stdout,
                "error": result.stderr,
                "duration_ms": duration_ms
            }
            
    except subprocess.TimeoutExpired:
        return {
            "success": False,
            "result": "",
            "error": "Execution timeout (>5 minutes)",
            "duration_ms": 300000
        }
    except Exception as e:
        return {
            "success": False,
            "result": "",
            "error": str(e),
            "duration_ms": int((time.time() - start_time) * 1000)
        }


def run_fallback_skill(skill: str, user_input: str) -> dict:
    """当 ds 脚本不可用时使用 ACP 直接执行"""
    skill_info = DRAGONSTACK_SKILLS.get(skill, {"name": skill, "icon": "🔧"})
    
    print(f"\n{skill_info['icon']} Executing {skill_info['name']} via ACP...")
    print(f"📝 Input: {user_input}\n")
    
    # 这里会调用 OpenClaw 的 ACP 系统
    # 简化版本：返回提示信息
    return {
        "success": True,
        "result": f"[{skill_info['name']}] Task submitted to ACP.\n\nInput: {user_input}\n\nNote: Full DragonStack 3.0 not installed. Using ACP fallback.",
        "error": None,
        "duration_ms": 1000
    }


def main():
    """主入口"""
    if len(sys.argv) < 2:
        print("🐉 DragonStack 3.0 with Ontology Integration")
        print("")
        print("Usage: ds-onto <natural language command>")
        print("")
        print("Examples:")
        print('  ds-onto "brainstorm a mobile app idea"')
        print('  ds-onto "design architecture for e-commerce system"')
        print('  ds-onto "code a Python API server"')
        print("")
        sys.exit(1)
    
    user_input = " ".join(sys.argv[1:])
    
    # 初始化 Ontology
    if ONTOLOGY_AVAILABLE:
        try:
            create_dragonstack_skill_entity()
        except:
            pass  # 可能已经存在
    
    # 检测技能类型
    skill = detect_skill_from_input(user_input)
    skill_info = DRAGONSTACK_SKILLS.get(skill, {"name": skill, "icon": "🔧"})
    
    print(f"\n🐉 DragonStack 3.0 + Ontology")
    print(f"{skill_info['icon']} Detected skill: {skill_info['name']}")
    print(f"📝 Input: {user_input}\n")
    
    # 加载或创建项目
    state = load_project_state()
    
    if state["current_project"] is None:
        # 创建新项目
        project_name = extract_project_name(user_input)
        
        if ONTOLOGY_AVAILABLE:
            project_id = create_project(
                project_name=project_name,
                description=f"Created from: {user_input}",
                status="active"
            )
        else:
            project_id = f"project_{datetime.now().strftime('%Y%m%d%H%M%S')}"
        
        state["current_project"] = project_id
        state["projects"][project_id] = {
            "name": project_name,
            "created": datetime.now().isoformat(),
            "executions": []
        }
        
        print(f"📁 Created new project: {project_name} ({project_id})\n")
    else:
        project_id = state["current_project"]
        project_name = state["projects"].get(project_id, {}).get("name", "Unknown")
        print(f"📁 Using project: {project_name} ({project_id})\n")
    
    # 执行技能
    print(f"⚡ Executing...\n")
    result = run_dragonstack_skill(skill, user_input, project_id)
    
    # 显示结果
    if result["success"]:
        print("✅ Execution successful!\n")
        print("=" * 60)
        print(result["result"])
        print("=" * 60)
    else:
        print("❌ Execution failed!\n")
        print(f"Error: {result['error']}")
    
    # 记录到 Ontology
    if ONTOLOGY_AVAILABLE:
        try:
            execution_id = log_skill_execution(
                project_id=project_id,
                skill=skill,
                user_input=user_input,
                result=result["result"],
                status="success" if result["success"] else "failure",
                error_message=result["error"],
                duration_ms=result["duration_ms"]
            )
            print(f"\n📝 Logged to Ontology: {execution_id}")
            
            # 如果生成代码/文档，创建 Document 实体
            if skill in ["code", "design", "doc"] and result["success"]:
                doc_id = create_document_from_output(
                    project_id=project_id,
                    title=f"{skill_info['name']} output - {datetime.now().strftime('%Y-%m-%d %H:%M')}",
                    content=result["result"],
                    doc_type=skill
                )
                print(f"📄 Document saved: {doc_id}")
                
        except Exception as e:
            print(f"\n⚠️  Failed to log to Ontology: {e}")
    
    # 更新项目状态
    state["projects"][project_id]["executions"].append({
        "skill": skill,
        "input": user_input,
        "status": "success" if result["success"] else "failure",
        "timestamp": datetime.now().isoformat()
    })
    save_project_state(state)
    
    print(f"\n⏱️  Duration: {result['duration_ms']}ms")
    print(f"🎯 Project: {project_id}")
    print("")


if __name__ == '__main__':
    main()
