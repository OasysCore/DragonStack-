#!/usr/bin/env python3
"""
DragonStack Ontology Integration
龙栈与 Ontology 知识图谱集成模块

功能:
- 龙栈执行结果自动存入 Ontology
- 项目状态同步
- 执行历史记录
- 错误/学习自动捕获
"""

import json
import sys
import os
import uuid
from datetime import datetime
from pathlib import Path
from typing import Optional, Dict, Any, List

# Ontology 路径
ONTOLOGY_DIR = Path.home() / ".openclaw/workspace/memory/ontology"
GRAPH_FILE = ONTOLOGY_DIR / "graph.jsonl"

# 龙栈技能映射
DRAGONSTACK_SKILLS = {
    "brainstorm": {"name": "头脑风暴", "phase": "构思", "icon": "💭"},
    "design": {"name": "架构设计", "phase": "设计", "icon": "🎨"},
    "code": {"name": "代码生成", "phase": "开发", "icon": "💻"},
    "review": {"name": "代码审查", "phase": "审查", "icon": "👁️"},
    "test": {"name": "测试", "phase": "测试", "icon": "🧪"},
    "ship": {"name": "发布部署", "phase": "部署", "icon": "🚀"},
    "debug": {"name": "调试", "phase": "维护", "icon": "🐛"},
    "doc": {"name": "文档", "phase": "文档", "icon": "📝"},
    "refactor": {"name": "重构", "phase": "优化", "icon": "♻️"}
}


def generate_id(prefix: str = "") -> str:
    """生成唯一 ID"""
    return f"{prefix}_{uuid.uuid4().hex[:8]}"


def append_record(record: Dict[str, Any]):
    """追加记录到 Ontology"""
    ONTOLOGY_DIR.mkdir(parents=True, exist_ok=True)
    with open(GRAPH_FILE, 'a', encoding='utf-8') as f:
        f.write(json.dumps(record, ensure_ascii=False) + '\n')


def create_project(project_name: str, description: str = "", 
                   status: str = "active") -> str:
    """
    创建龙栈项目
    
    Args:
        project_name: 项目名称
        description: 项目描述
        status: 项目状态 (active/paused/completed)
    
    Returns:
        项目 ID
    """
    project_id = generate_id("ds_project")
    entity = {
        'id': project_id,
        'type': 'Project',
        'properties': {
            'name': project_name,
            'description': description,
            'status': status,
            'framework': 'DragonStack',
            'created_by': 'dragonstack',
            'version': '3.0-beta'
        },
        'created': datetime.now().isoformat(),
        'updated': datetime.now().isoformat()
    }
    
    record = {'op': 'create', 'entity': entity}
    append_record(record)
    
    # 关联到 DragonStack Skill
    skill_entity_id = "document_dragonstack"  # 需要预先创建
    
    return project_id


def log_skill_execution(project_id: str, skill: str, 
                        user_input: str, result: str,
                        status: str = "success", 
                        error_message: str = None,
                        duration_ms: int = None) -> str:
    """
    记录技能执行
    
    Args:
        project_id: 关联的项目 ID
        skill: 技能名称 (brainstorm/design/code等)
        user_input: 用户输入
        result: 执行结果
        status: 执行状态 (success/failure)
        error_message: 错误信息 (如果失败)
        duration_ms: 执行耗时(毫秒)
    
    Returns:
        执行记录 ID
    """
    execution_id = generate_id("ds_exec")
    
    skill_info = DRAGONSTACK_SKILLS.get(skill, {"name": skill, "phase": "unknown", "icon": "🔧"})
    
    entity = {
        'id': execution_id,
        'type': 'Action',
        'properties': {
            'type': f'dragonstack_{skill}',
            'name': f"{skill_info['icon']} {skill_info['name']}",
            'phase': skill_info['phase'],
            'user_input': user_input,
            'result_summary': result[:500] if len(result) > 500 else result,  # 摘要
            'status': status,
            'error_message': error_message,
            'duration_ms': duration_ms,
            'project_id': project_id
        },
        'created': datetime.now().isoformat(),
        'updated': datetime.now().isoformat()
    }
    
    record = {'op': 'create', 'entity': entity}
    append_record(record)
    
    # 建立与项目的关系
    relate_record = {
        'op': 'relate',
        'from': project_id,
        'rel': 'has_action',
        'to': execution_id,
        'properties': {'type': skill},
        'created': datetime.now().isoformat()
    }
    append_record(relate_record)
    
    # 如果失败，自动创建学习记录
    if status == "failure" and error_message:
        create_learning_from_error(skill, error_message, user_input)
    
    return execution_id


def create_learning_from_error(skill: str, error: str, context: str):
    """从错误创建学习记录"""
    note_id = generate_id("ds_lesson")
    
    entity = {
        'id': note_id,
        'type': 'Note',
        'properties': {
            'title': f'DragonStack {skill} 错误记录',
            'content': f"错误: {error}\n\n上下文: {context}",
            'tags': ['dragonstack', 'lesson', skill, 'error'],
            'source_skill': skill,
            'date': datetime.now().strftime('%Y-%m-%d')
        },
        'created': datetime.now().isoformat(),
        'updated': datetime.now().isoformat()
    }
    
    record = {'op': 'create', 'entity': entity}
    append_record(record)
    
    # 同时写入 .learnings/ERRORS.md
    write_to_learnings(skill, error, context)


def write_to_learnings(skill: str, error: str, context: str):
    """同时写入 Self-Improving Agent 的学习文件"""
    learnings_dir = Path.home() / ".openclaw/workspace/.learnings"
    learnings_dir.mkdir(exist_ok=True)
    
    errors_file = learnings_dir / "ERRORS.md"
    
    entry = f"""
### [{datetime.now().strftime('%Y-%m-%d')}] DragonStack {skill} Error

**Error:** {error}

**Context:** {context}

**Skill:** {skill}

---
"""
    
    with open(errors_file, 'a', encoding='utf-8') as f:
        f.write(entry)


def create_document_from_output(project_id: str, title: str, 
                                content: str, doc_type: str = "code") -> str:
    """
    从龙栈输出创建文档实体
    
    Args:
        project_id: 关联项目 ID
        title: 文档标题
        content: 文档内容
        doc_type: 文档类型 (code/design/doc等)
    
    Returns:
        文档 ID
    """
    doc_id = generate_id("ds_doc")
    
    entity = {
        'id': doc_id,
        'type': 'Document',
        'properties': {
            'title': title,
            'content_preview': content[:1000] if len(content) > 1000 else content,
            'doc_type': doc_type,
            'source': 'dragonstack',
            'project_id': project_id
        },
        'created': datetime.now().isoformat(),
        'updated': datetime.now().isoformat()
    }
    
    record = {'op': 'create', 'entity': entity}
    append_record(record)
    
    # 建立关系
    relate_record = {
        'op': 'relate',
        'from': project_id,
        'rel': 'has_document',
        'to': doc_id,
        'properties': {},
        'created': datetime.now().isoformat()
    }
    append_record(relate_record)
    
    return doc_id


def update_project_status(project_id: str, status: str):
    """更新项目状态"""
    # Ontology 是 append-only，创建更新记录
    update_id = generate_id("ds_update")
    
    entity = {
        'id': update_id,
        'type': 'Action',
        'properties': {
            'type': 'project_status_update',
            'project_id': project_id,
            'new_status': status,
            'updated_by': 'dragonstack'
        },
        'created': datetime.now().isoformat(),
        'updated': datetime.now().isoformat()
    }
    
    record = {'op': 'create', 'entity': entity}
    append_record(record)


def get_project_history(project_id: str) -> List[Dict]:
    """
    获取项目执行历史
    
    Args:
        project_id: 项目 ID
    
    Returns:
        执行记录列表
    """
    history = []
    
    if not GRAPH_FILE.exists():
        return history
    
    with open(GRAPH_FILE, 'r', encoding='utf-8') as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            try:
                record = json.loads(line)
                if record.get('op') == 'create' and 'entity' in record:
                    entity = record['entity']
                    if entity.get('type') == 'Action':
                        props = entity.get('properties', {})
                        if props.get('project_id') == project_id:
                            history.append(entity)
            except json.JSONDecodeError:
                continue
    
    return sorted(history, key=lambda x: x['created'], reverse=True)


def create_dragonstack_skill_entity():
    """创建 DragonStack Skill 实体 (初始化时调用)"""
    skill_id = "document_dragonstack"
    
    entity = {
        'id': skill_id,
        'type': 'Document',
        'properties': {
            'title': 'DragonStack',
            'type': 'skill',
            'version': '3.0.0-beta',
            'description': 'AI development workflow - natural language execution',
            'status': 'installed',
            'installation_date': datetime.now().strftime('%Y-%m-%d'),
            'skills': list(DRAGONSTACK_SKILLS.keys())
        },
        'created': datetime.now().isoformat(),
        'updated': datetime.now().isoformat()
    }
    
    record = {'op': 'create', 'entity': entity}
    append_record(record)
    
    return skill_id


# CLI 接口
if __name__ == '__main__':
    import argparse
    
    parser = argparse.ArgumentParser(description='DragonStack Ontology Integration')
    subparsers = parser.add_subparsers(dest='command')
    
    # init - 初始化
    init_parser = subparsers.add_parser('init', help='Initialize DragonStack in Ontology')
    
    # create-project
    project_parser = subparsers.add_parser('create-project', help='Create a new project')
    project_parser.add_argument('--name', required=True, help='Project name')
    project_parser.add_argument('--description', default='', help='Project description')
    
    # log-execution
    log_parser = subparsers.add_parser('log-execution', help='Log skill execution')
    log_parser.add_argument('--project-id', required=True, help='Project ID')
    log_parser.add_argument('--skill', required=True, help='Skill name')
    log_parser.add_argument('--input', required=True, help='User input')
    log_parser.add_argument('--result', required=True, help='Execution result')
    log_parser.add_argument('--status', default='success', help='Execution status')
    
    # history
    history_parser = subparsers.add_parser('history', help='Get project history')
    history_parser.add_argument('--project-id', required=True, help='Project ID')
    
    args = parser.parse_args()
    
    if args.command == 'init':
        create_dragonstack_skill_entity()
        print("✅ DragonStack initialized in Ontology")
    
    elif args.command == 'create-project':
        pid = create_project(args.name, args.description)
        print(f"Created project: {pid}")
    
    elif args.command == 'log-execution':
        eid = log_skill_execution(
            args.project_id, args.skill, args.input, args.result, args.status
        )
        print(f"Logged execution: {eid}")
    
    elif args.command == 'history':
        history = get_project_history(args.project_id)
        for h in history:
            props = h['properties']
            print(f"[{h['created']}] {props.get('name', 'Unknown')}: {props.get('status')}")
    
    else:
        parser.print_help()
