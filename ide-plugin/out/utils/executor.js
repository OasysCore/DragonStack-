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
exports.executeSkill = executeSkill;
const vscode = __importStar(require("vscode"));
const child_process_1 = require("child_process");
const util_1 = require("util");
const execAsync = (0, util_1.promisify)(child_process_1.exec);
async function executeSkill(skill, input) {
    const outputChannel = vscode.window.createOutputChannel('DragonStack');
    outputChannel.show();
    outputChannel.appendLine(`🐉 DragonStack: ${skill}`);
    outputChannel.appendLine(`Input: ${input}`);
    outputChannel.appendLine('---');
    try {
        // 调用 ds-onto 脚本
        const { stdout, stderr } = await execAsync(`python3 ~/.openclaw/workspace/skills/dragonstack/scripts/ds-onto.py "${input}"`, { timeout: 300000 } // 5分钟超时
        );
        if (stdout) {
            outputChannel.appendLine(stdout);
            // 尝试提取代码块并插入编辑器
            const codeBlocks = extractCodeBlocks(stdout);
            if (codeBlocks.length > 0) {
                const action = await vscode.window.showInformationMessage(`DragonStack generated ${codeBlocks.length} code blocks. Insert into editor?`, 'Insert', 'Copy to Clipboard', 'Dismiss');
                if (action === 'Insert') {
                    const editor = vscode.window.activeTextEditor;
                    if (editor) {
                        editor.edit(editBuilder => {
                            codeBlocks.forEach(block => {
                                editBuilder.insert(editor.selection.active, block + '\n\n');
                            });
                        });
                    }
                }
                else if (action === 'Copy to Clipboard') {
                    vscode.env.clipboard.writeText(codeBlocks.join('\n\n'));
                    vscode.window.showInformationMessage('Code copied to clipboard!');
                }
            }
        }
        if (stderr) {
            outputChannel.appendLine(`Error: ${stderr}`);
        }
    }
    catch (error) {
        outputChannel.appendLine(`Execution failed: ${error}`);
        vscode.window.showErrorMessage(`DragonStack execution failed: ${error}`);
    }
}
function extractCodeBlocks(text) {
    const codeBlockRegex = /```[\w]*\n([\s\S]*?)```/g;
    const blocks = [];
    let match;
    while ((match = codeBlockRegex.exec(text)) !== null) {
        blocks.push(match[1].trim());
    }
    return blocks;
}
//# sourceMappingURL=executor.js.map