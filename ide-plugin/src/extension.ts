import * as vscode from 'vscode';
import { DragonStackSidebarProvider } from './sidebar/sidebarProvider';
import { executeSkill } from './utils/executor';

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

export function activate(context: vscode.ExtensionContext) {
  console.log('DragonStack IDE extension activated');

  // 注册侧边栏
  const sidebarProvider = new DragonStackSidebarProvider(context.extensionUri);
  context.subscriptions.push(
    vscode.window.registerWebviewViewProvider('dragonstackSidebar', sidebarProvider)
  );

  // 注册9个技能命令
  skills.forEach(skill => {
    const disposable = vscode.commands.registerCommand(`dragonstack.${skill.id}`, async () => {
      const input = await vscode.window.showInputBox({
        prompt: `${skill.name}: ${skill.description}`,
        placeHolder: 'Describe what you need...'
      });

      if (input) {
        await executeSkill(skill.id, input);
      }
    });
    context.subscriptions.push(disposable);
  });

  // 注册打开侧边栏命令
  context.subscriptions.push(
    vscode.commands.registerCommand('dragonstack.openSidebar', () => {
      vscode.commands.executeCommand('workbench.view.explorer');
    })
  );

  // 注册选中代码的右键菜单
  context.subscriptions.push(
    vscode.commands.registerCommand('dragonstack.codeWithSelection', async () => {
      const editor = vscode.window.activeTextEditor;
      if (editor) {
        const selection = editor.document.getText(editor.selection);
        const input = await vscode.window.showInputBox({
          prompt: '💻 Code: What do you want to do with the selected code?',
          value: selection.substring(0, 100)
        });
        if (input) {
          await executeSkill('code', input);
        }
      }
    })
  );
}

export function deactivate() {}
