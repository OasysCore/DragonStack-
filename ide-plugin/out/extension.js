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
exports.activate = activate;
exports.deactivate = deactivate;
const vscode = __importStar(require("vscode"));
const sidebarProvider_1 = require("./sidebar/sidebarProvider");
const executor_1 = require("./utils/executor");
const skills = [
    { id: 'brainstorm', name: '💭 Brainstorm', description: '头脑风暴 - 构思创意' },
    { id: 'design', name: '🎨 Design', description: '架构设计 - 系统设计' },
    { id: 'code', name: '💻 Code', description: '代码生成 - 编写代码' },
    { id: 'review', name: '👁️ Review', description: '代码审查 - 检查质量' },
    { id: 'test', name: '🧪 Test', description: '测试 - 验证功能' },
    { id: 'ship', name: '🚀 Ship', description: '发布部署 - 上线运行' },
    { id: 'debug', name: '🐛 Debug', description: '调试 - 修复问题' },
    { id: 'doc', name: '📝 Document', description: '文档 - 编写文档' },
    { id: 'refactor', name: '♻️ Refactor', description: '重构 - 优化代码' }
];
function activate(context) {
    console.log('DragonStack IDE extension activated');
    // 注册侧边栏
    const sidebarProvider = new sidebarProvider_1.DragonStackSidebarProvider(context.extensionUri);
    context.subscriptions.push(vscode.window.registerWebviewViewProvider('dragonstackSidebar', sidebarProvider));
    // 注册9个技能命令
    skills.forEach(skill => {
        const disposable = vscode.commands.registerCommand(`dragonstack.${skill.id}`, async () => {
            const input = await vscode.window.showInputBox({
                prompt: `${skill.name}: ${skill.description}`,
                placeHolder: 'Describe what you need...'
            });
            if (input) {
                await (0, executor_1.executeSkill)(skill.id, input);
            }
        });
        context.subscriptions.push(disposable);
    });
    // 注册打开侧边栏命令
    context.subscriptions.push(vscode.commands.registerCommand('dragonstack.openSidebar', () => {
        vscode.commands.executeCommand('workbench.view.explorer');
    }));
    // 注册选中代码的右键菜单
    context.subscriptions.push(vscode.commands.registerCommand('dragonstack.codeWithSelection', async () => {
        const editor = vscode.window.activeTextEditor;
        if (editor) {
            const selection = editor.document.getText(editor.selection);
            const input = await vscode.window.showInputBox({
                prompt: '💻 Code: What do you want to do with the selected code?',
                value: selection.substring(0, 100)
            });
            if (input) {
                await (0, executor_1.executeSkill)('code', input);
            }
        }
    }));
}
function deactivate() { }
//# sourceMappingURL=extension.js.map