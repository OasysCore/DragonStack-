#!/usr/bin/env python3
"""
DragonStack Intent Recognition Engine
龙栈意图识别引擎 - 优化版

特性:
- 多层级意图识别
- 复合指令解析 (design + code)
- 上下文保持
- 模糊匹配
- 置信度评分
"""

import re
import json
from typing import List, Dict, Tuple, Optional
from dataclasses import dataclass
from pathlib import Path

@dataclass
class IntentMatch:
    """意图匹配结果"""
    skill: str
    confidence: float  # 0-1
    keywords_matched: List[str]
    context_hints: Dict[str, any]


class IntentRecognizer:
    """意图识别器"""
    
    # 技能定义
    SKILLS = {
        "brainstorm": {
            "name": "头脑风暴",
            "icon": "💭",
            "phase": "构思",
            "keywords": {
                "primary": ["brainstorm", "构思", "头脑风暴", "想法", "创意", "ideation", "concept"],
                "secondary": ["想", "思考", "探索", "可能性", "方案", "点子", "idea"],
                "context": ["新产品", "新功能", "创新", "突破", "灵感"]
            },
            "patterns": [
                r"(brainstorm|构思).*(idea|想法|创意)",
                r"(想|思考).*(做什么|怎么做)",
                r"(有什么|给点).*(想法|建议|思路)"
            ]
        },
        "design": {
            "name": "架构设计",
            "icon": "🎨",
            "phase": "设计",
            "keywords": {
                "primary": ["design", "架构", "设计", "structure", "schema", "architecture"],
                "secondary": ["规划", "方案", "结构", "模型", "蓝图", "框架"],
                "context": ["系统", "模块", "组件", "接口", "API", "数据库"]
            },
            "patterns": [
                r"(design|设计|架构).*(system|系统|app|应用)",
                r"(怎么|如何).*(设计|架构|规划)",
                r"(画|做).*(架构图|设计图|蓝图)"
            ]
        },
        "code": {
            "name": "代码生成",
            "icon": "💻",
            "phase": "开发",
            "keywords": {
                "primary": ["code", "代码", "生成", "写", "实现", "program", "develop", "编写"],
                "secondary": ["函数", "类", "模块", "脚本", "程序", "应用", "软件"],
                "context": ["Python", "Go", "JavaScript", "TypeScript", "Rust", "Java", "C++", "语言"]
            },
            "patterns": [
                r"(code|写|生成).*(function|函数|class|类)",
                r"(用|使用).*(Python|Go|JS).*(写|实现|开发)",
                r"(帮我|给我).*(写|生成|做).*(代码|程序|脚本)"
            ]
        },
        "review": {
            "name": "代码审查",
            "icon": "👁️",
            "phase": "审查",
            "keywords": {
                "primary": ["review", "审查", "检查", "code review", "评审", "检视"],
                "secondary": ["看看", "检查一下", "评估", "质量", "问题", "bug"],
                "context": ["代码质量", "性能", "安全", "规范", "最佳实践"]
            },
            "patterns": [
                r"(review|检查|审查).*(code|代码)",
                r"(看看|检查一下).*(这段|这个).*(代码|实现)",
                r"(有什么|有没有).*(问题|bug|错误)"
            ]
        },
        "test": {
            "name": "测试",
            "icon": "🧪",
            "phase": "测试",
            "keywords": {
                "primary": ["test", "测试", "unittest", "验证", "检验", "test case"],
                "secondary": ["测一下", "跑测试", "覆盖率", "TDD", "BDD"],
                "context": ["单元测试", "集成测试", "E2E", "自动化测试", "测试用例"]
            },
            "patterns": [
                r"(test|测试).*(case|用例|function|函数)",
                r"(写|生成).*(test|测试).*(case|用例)",
                r"(怎么|如何).*(测试|验证)"
            ]
        },
        "ship": {
            "name": "发布部署",
            "icon": "🚀",
            "phase": "部署",
            "keywords": {
                "primary": ["ship", "发布", "部署", "deploy", "上线", "release", "delivery"],
                "secondary": ["上线", "投产", "发版", "交付", "发布版本"],
                "context": ["生产环境", "服务器", "Docker", "K8s", "CI/CD", "Pipeline"]
            },
            "patterns": [
                r"(deploy|部署|发布).*(app|应用|service|服务)",
                r"(上线|发布).*(版本|release)",
                r"(怎么|如何).*(部署|上线|发布)"
            ]
        },
        "debug": {
            "name": "调试",
            "icon": "🐛",
            "phase": "维护",
            "keywords": {
                "primary": ["debug", "调试", "bug", "修复", "fix", "troubleshoot", "解决"],
                "secondary": ["报错", "错误", "异常", "崩溃", "失败", "问题排查"],
                "context": ["error", "exception", "stack trace", "日志", "log"]
            },
            "patterns": [
                r"(debug|调试|修复|fix).*(bug|错误|问题)",
                r"(有|遇到).*(bug|错误|异常|问题)",
                r"(为什么|怎么).*(报错|失败|出错)"
            ]
        },
        "doc": {
            "name": "文档",
            "icon": "📝",
            "phase": "文档",
            "keywords": {
                "primary": ["doc", "文档", "documentation", "readme", "说明", "注释"],
                "secondary": ["写文档", "文档化", "API文档", "使用说明", "教程"],
                "context": ["README", "Wiki", "Confluence", "Markdown", "Swagger"]
            },
            "patterns": [
                r"(write|写|生成).*(doc|文档|readme)",
                r"(doc|文档).*(for|关于|针对)",
                r"(怎么|如何).*(使用|安装|配置)"
            ]
        },
        "refactor": {
            "name": "重构",
            "icon": "♻️",
            "phase": "优化",
            "keywords": {
                "primary": ["refactor", "重构", "优化", "改进", "rewrite", "cleanup", "清理"],
                "secondary": ["简化", "改进", "提升", "性能优化", "代码清理", "整理"],
                "context": ["性能", "可读性", "可维护性", "技术债", "代码质量"]
            },
            "patterns": [
                r"(refactor|重构|优化).*(code|代码|function|函数)",
                r"(改进|优化).*(性能|代码|结构)",
                r"(这段|这个).*(代码|实现).*(太乱|不好|需要改进)"
            ]
        }
    }
    
    # 复合指令关键词
    COMPOSITE_KEYWORDS = ["然后", "接着", "再", "and then", "followed by", "->", "→"]
    
    def __init__(self):
        self.context_history = []
        self.current_project = None
    
    def recognize(self, user_input: str, context: Dict = None) -> List[IntentMatch]:
        """
        识别用户意图
        
        Args:
            user_input: 用户输入
            context: 上下文信息
            
        Returns:
            按置信度排序的意图匹配列表
        """
        user_input_lower = user_input.lower()
        matches = []
        
        # 检查是否是复合指令
        composite_parts = self._split_composite(user_input)
        if len(composite_parts) > 1:
            return self._handle_composite(composite_parts)
        
        # 对每个技能进行匹配
        for skill_id, skill_def in self.SKILLS.items():
            match = self._match_skill(skill_id, skill_def, user_input_lower)
            if match.confidence > 0.3:  # 最低置信度阈值
                matches.append(match)
        
        # 按置信度排序
        matches.sort(key=lambda x: x.confidence, reverse=True)
        
        # 添加上下文提示
        if context:
            matches = self._apply_context(matches, context)
        
        return matches
    
    def _match_skill(self, skill_id: str, skill_def: Dict, user_input: str) -> IntentMatch:
        """匹配单个技能"""
        keywords = skill_def["keywords"]
        patterns = skill_def.get("patterns", [])
        
        score = 0.0
        matched_keywords = []
        
        # 1. 主关键词匹配 (权重: 0.5)
        for kw in keywords["primary"]:
            if kw.lower() in user_input:
                score += 0.5
                matched_keywords.append(kw)
        
        # 2. 次关键词匹配 (权重: 0.3)
        for kw in keywords["secondary"]:
            if kw.lower() in user_input:
                score += 0.3
                matched_keywords.append(kw)
        
        # 3. 上下文关键词匹配 (权重: 0.2)
        for kw in keywords.get("context", []):
            if kw.lower() in user_input:
                score += 0.2
                matched_keywords.append(kw)
        
        # 4. 正则模式匹配 (权重: 0.4)
        for pattern in patterns:
            if re.search(pattern, user_input, re.IGNORECASE):
                score += 0.4
        
        # 5. 位置加分 (关键词在开头)
        first_word = user_input.split()[0] if user_input else ""
        if first_word in keywords["primary"]:
            score += 0.1
        
        # 归一化置信度 (0-1)
        confidence = min(score, 1.0)
        
        return IntentMatch(
            skill=skill_id,
            confidence=confidence,
            keywords_matched=list(set(matched_keywords)),
            context_hints={}
        )
    
    def _split_composite(self, user_input: str) -> List[str]:
        """拆分复合指令"""
        parts = [user_input]
        
        for keyword in self.COMPOSITE_KEYWORDS:
            new_parts = []
            for part in parts:
                split_parts = part.split(keyword)
                new_parts.extend([p.strip() for p in split_parts if p.strip()])
            parts = new_parts
        
        return parts
    
    def _handle_composite(self, parts: List[str]) -> List[IntentMatch]:
        """处理复合指令"""
        matches = []
        
        for part in parts:
            part_matches = self.recognize(part)
            if part_matches:
                matches.append(part_matches[0])  # 取每个部分的最佳匹配
        
        return matches
    
    def _apply_context(self, matches: List[IntentMatch], context: Dict) -> List[IntentMatch]:
        """应用上下文信息调整置信度"""
        current_phase = context.get("current_phase", "")
        last_skill = context.get("last_skill", "")
        
        for match in matches:
            skill_def = self.SKILLS.get(match.skill, {})
            
            # 如果匹配的技能是下一个合理阶段，增加置信度
            phase_flow = {
                "构思": ["设计"],
                "设计": ["开发", "文档"],
                "开发": ["审查", "测试", "文档"],
                "审查": ["测试", "开发"],
                "测试": ["部署", "调试"],
                "调试": ["开发", "测试"],
                "部署": ["维护", "文档"]
            }
            
            if current_phase in phase_flow:
                next_phases = phase_flow[current_phase]
                if skill_def.get("phase") in next_phases:
                    match.confidence = min(match.confidence + 0.1, 1.0)
                    match.context_hints["phase_match"] = True
        
        return matches
    
    def get_best_match(self, user_input: str, context: Dict = None) -> Optional[IntentMatch]:
        """获取最佳匹配"""
        matches = self.recognize(user_input, context)
        if matches and matches[0].confidence > 0.5:
            return matches[0]
        return None
    
    def explain(self, user_input: str) -> str:
        """解释识别结果（用于调试）"""
        matches = self.recognize(user_input)
        
        if not matches:
            return f"无法识别意图: '{user_input}'"
        
        lines = [f"🎯 意图识别结果: '{user_input}'", ""]
        
        for i, match in enumerate(matches[:3], 1):
            skill_def = self.SKILLS.get(match.skill, {})
            lines.append(f"{i}. {skill_def.get('icon', '🔧')} {skill_def.get('name', match.skill)}")
            lines.append(f"   置信度: {match.confidence:.2%}")
            lines.append(f"   匹配关键词: {', '.join(match.keywords_matched[:5])}")
            lines.append("")
        
        return "\n".join(lines)


# 全局识别器实例
_recognizer = None

def get_recognizer() -> IntentRecognizer:
    """获取全局识别器实例"""
    global _recognizer
    if _recognizer is None:
        _recognizer = IntentRecognizer()
    return _recognizer


def detect_skill(user_input: str, context: Dict = None) -> str:
    """
    检测技能类型（简化接口）
    
    Args:
        user_input: 用户输入
        context: 上下文
        
    Returns:
        技能 ID (brainstorm/design/code/...)
    """
    recognizer = get_recognizer()
    match = recognizer.get_best_match(user_input, context)
    
    if match:
        return match.skill
    
    # 默认返回 code
    return "code"


def detect_skills(user_input: str) -> List[str]:
    """
    检测多个技能（复合指令）
    
    Args:
        user_input: 用户输入
        
    Returns:
        技能 ID 列表
    """
    recognizer = get_recognizer()
    matches = recognizer.recognize(user_input)
    
    # 返回所有置信度 > 0.5 的技能
    return [m.skill for m in matches if m.confidence > 0.5]


# CLI 测试
if __name__ == '__main__':
    import sys
    
    if len(sys.argv) > 1:
        user_input = " ".join(sys.argv[1:])
        recognizer = get_recognizer()
        print(recognizer.explain(user_input))
    else:
        # 交互式测试
        print("🐉 DragonStack Intent Recognition Engine")
        print("输入测试语句 (quit退出):")
        print("")
        
        recognizer = get_recognizer()
        
        while True:
            try:
                user_input = input("> ")
                if user_input.lower() in ['quit', 'exit', 'q']:
                    break
                
                print(recognizer.explain(user_input))
                print("-" * 50)
            except EOFError:
                break
