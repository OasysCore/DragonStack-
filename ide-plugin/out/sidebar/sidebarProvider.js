"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
Object.defineProperty(exports, "__esModule", { value: true });
exports.DragonStackSidebarProvider = void 0;
const vscode = __importStar(require("vscode"));
class DragonStackSidebarProvider {
    constructor(_extensionUri) {
        this._extensionUri = _extensionUri;
    }
    resolveWebviewView(webviewView, context, _token) {
        webviewView.webview.options = {
            enableScripts: true,
            localResourceRoots: [this._extensionUri]
        };
        webviewView.webview.html = this._getHtmlForWebview(webviewView.webview);
        // 处理来自 webview 的消息
        webviewView.webview.onDidReceiveMessage(async (message) => {
            switch (message.command) {
                case 'executeSkill':
                    const { skill, input } = message;
                    await vscode.commands.executeCommand(`dragonstack.${skill}`);
                    break;
            }
        });
    }
    _getHtmlForWebview(webview) {
        return `<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DragonStack</title>
    <style>
        body {
            font-family: var(--vscode-font-family);
            padding: 10px;
            color: var(--vscode-foreground);
        }
        .header {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 1px solid var(--vscode-panel-border);
        }
        .skill-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 8px;
            margin-bottom: 20px;
        }
        .skill-btn {
            padding: 10px;
            border: 1px solid var(--vscode-button-border);
            background: var(--vscode-button-background);
            color: var(--vscode-button-foreground);
            cursor: pointer;
            border-radius: 4px;
            text-align: left;
            transition: all 0.2s;
        }
        .skill-btn:hover {
            background: var(--vscode-button-hoverBackground);
        }
        .skill-icon {
            font-size: 18px;
            margin-right: 5px;
        }
        .skill-name {
            font-weight: bold;
            font-size: 12px;
        }
        .skill-desc {
            font-size: 10px;
            opacity: 0.8;
            margin-top: 2px;
        }
        .section {
            margin-top: 20px;
        }
        .section-title {
            font-size: 12px;
            font-weight: bold;
            margin-bottom: 10px;
            text-transform: uppercase;
            opacity: 0.7;
        }
        .quick-input {
            width: 100%;
            padding: 8px;
            border: 1px solid var(--vscode-input-border);
            background: var(--vscode-input-background);
            color: var(--vscode-input-foreground);
            border-radius: 4px;
            margin-bottom: 10px;
        }
        .project-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .project-item {
            padding: 8px;
            border: 1px solid var(--vscode-panel-border);
            margin-bottom: 5px;
            border-radius: 4px;
            cursor: pointer;
        }
        .project-item:hover {
            background: var(--vscode-list-hoverBackground);
        }
        .status-badge {
            display: inline-block;
            padding: 2px 6px;
            border-radius: 3px;
            font-size: 10px;
            margin-left: 5px;
        }
        .status-active { background: #00b894; color: white; }
        .status-paused { background: #fdcb6e; color: black; }
    </style>
</head>
<body>
    <div class="header">🐉 DragonStack</div>
    
    <div class="skill-grid">
        <button class="skill-btn" onclick="executeSkill('brainstorm')">
            <span class="skill-icon">💭</span>
            <div class="skill-name">Brainstorm</div>
            <div class="skill-desc">头脑风暴</div>
        </button>
        <button class="skill-btn" onclick="executeSkill('design')">
            <span class="skill-icon">🎨</span>
            <div class="skill-name">Design</div>
            <div class="skill-desc">架构设计</div>
        </button>
        <button class="skill-btn" onclick="executeSkill('code')">
            <span class="skill-icon">💻</span>
            <div class="skill-name">Code</div>
            <div class="skill-desc">代码生成</div>
        </button>
        <button class="skill-btn" onclick="executeSkill('review')">
            <span class="skill-icon">👁️</span>
            <div class="skill-name">Review</div>
            <div class="skill-desc">代码审查</div>
        </button>
        <button class="skill-btn" onclick="executeSkill('test')">
            <span class="skill-icon">🧪</span>
            <div class="skill-name">Test</div>
            <div class="skill-desc">测试</div>
        </button>
        <button class="skill-btn" onclick="executeSkill('ship')">
            <span class="skill-icon">🚀</span>
            <div class="skill-name">Ship</div>
            <div class="skill-desc">发布部署</div>
        </button>
        <button class="skill-btn" onclick="executeSkill('debug')">
            <span class="skill-icon">🐛</span>
            <div class="skill-name">Debug</div>
            <div class="skill-desc">调试</div>
        </button>
        <button class="skill-btn" onclick="executeSkill('doc')">
            <span class="skill-icon">📝</span>
            <div class="skill-name">Document</div>
            <div class="skill-desc">文档</div>
        </button>
    </div>

    <div class="section">
        <div class="section-title">Quick Input</div>
        <input type="text" class="quick-input" id="quickInput" 
               placeholder="Type your request and press Enter..."
               onkeypress="handleQuickInput(event)">
    </div>

    <div class="section">
        <div class="section-title">Recent Projects</div>
        <ul class="project-list" id="projectList">
            <li class="project-item">
                OpenClaw Setup
                <span class="status-badge status-active">active</span>
            </li>
            <li class="project-item">
                AI Video Generator
                <span class="status-badge status-paused">paused</span>
            </li>
        </ul>
    </div>

    <script>
        const vscode = acquireVsCodeApi();

        function executeSkill(skill) {
            vscode.postMessage({
                command: 'executeSkill',
                skill: skill,
                input: ''
            });
        }

        function handleQuickInput(event) {
            if (event.key === 'Enter') {
                const input = document.getElementById('quickInput').value;
                if (input.trim()) {
                    vscode.postMessage({
                        command: 'executeSkill',
                        skill: 'auto',
                        input: input
                    });
                    document.getElementById('quickInput').value = '';
                }
            }
        }
    </script>
</body>
</html>`;
    }
}
exports.DragonStackSidebarProvider = DragonStackSidebarProvider;
//# sourceMappingURL=sidebarProvider.js.map