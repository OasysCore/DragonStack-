import * as vscode from 'vscode';
import { exec } from 'child_process';
import { promisify } from 'util';

const execAsync = promisify(exec);

export async function executeSkill(skill: string, input: string): Promise<void> {
  const outputChannel = vscode.window.createOutputChannel('DragonStack');
  outputChannel.show();
  outputChannel.appendLine(`🐉 DragonStack: ${skill}`);
  outputChannel.appendLine(`Input: ${input}`);
  outputChannel.appendLine('---');

  try {
    // 调用 ds-onto 脚本
    const { stdout, stderr } = await execAsync(
      `python3 ~/.openclaw/workspace/skills/dragonstack/scripts/ds-onto.py "${input}"`,
      { timeout: 300000 } // 5分钟超时
    );

    if (stdout) {
      outputChannel.appendLine(stdout);
      
      // 尝试提取代码块并插入编辑器
      const codeBlocks = extractCodeBlocks(stdout);
      if (codeBlocks.length > 0) {
        const action = await vscode.window.showInformationMessage(
          `DragonStack generated ${codeBlocks.length} code blocks. Insert into editor?`,
          'Insert', 'Copy to Clipboard', 'Dismiss'
        );

        if (action === 'Insert') {
          const editor = vscode.window.activeTextEditor;
          if (editor) {
            editor.edit(editBuilder => {
              codeBlocks.forEach(block => {
                editBuilder.insert(editor.selection.active, block + '\n\n');
              });
            });
          }
        } else if (action === 'Copy to Clipboard') {
          vscode.env.clipboard.writeText(codeBlocks.join('\n\n'));
          vscode.window.showInformationMessage('Code copied to clipboard!');
        }
      }
    }

    if (stderr) {
      outputChannel.appendLine(`Error: ${stderr}`);
    }
  } catch (error) {
    outputChannel.appendLine(`Execution failed: ${error}`);
    vscode.window.showErrorMessage(`DragonStack execution failed: ${error}`);
  }
}

function extractCodeBlocks(text: string): string[] {
  const codeBlockRegex = /```[\w]*\n([\s\S]*?)```/g;
  const blocks: string[] = [];
  let match;

  while ((match = codeBlockRegex.exec(text)) !== null) {
    blocks.push(match[1].trim());
  }

  return blocks;
}
