import { useState } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { Send, Loader2 } from 'lucide-react'

const skillInfo: Record<string, { name: string; icon: string; description: string }> = {
  brainstorm: { name: 'Brainstorm', icon: '💭', description: '头脑风暴 - 构思创意' },
  design: { name: 'Design', icon: '🎨', description: '架构设计 - 系统设计' },
  code: { name: 'Code', icon: '💻', description: '代码生成 - 编写代码' },
  review: { name: 'Review', icon: '👁️', description: '代码审查 - 检查质量' },
  test: { name: 'Test', icon: '🧪', description: '测试 - 验证功能' },
  ship: { name: 'Ship', icon: '🚀', description: '发布部署 - 上线运行' },
  debug: { name: 'Debug', icon: '🐛', description: '调试 - 修复问题' },
  doc: { name: 'Document', icon: '📝', description: '文档 - 编写文档' },
  refactor: { name: 'Refactor', icon: '♻️', description: '重构 - 优化代码' },
}

export default function Execute() {
  const { skill } = useParams<{ skill: string }>()
  const navigate = useNavigate()
  const [input, setInput] = useState('')
  const [isExecuting, setIsExecuting] = useState(false)
  const [result, setResult] = useState('')

  const info = skill ? skillInfo[skill] : null

  if (!info) {
    return <div>Invalid skill</div>
  }

  const handleExecute = async () => {
    if (!input.trim()) return

    setIsExecuting(true)
    setResult('')

    try {
      // 调用 API
      const response = await fetch(`/api/v1/skills/${skill}/execute`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ input }),
      })

      if (response.ok) {
        const data = await response.json()
        setResult(`Execution started: ${data.message}`)
      } else {
        setResult('Execution failed')
      }
    } catch (error) {
      setResult(`Error: ${error}`)
    } finally {
      setIsExecuting(false)
    }
  }

  return (
    <div className="p-8 max-w-4xl mx-auto">
      {/* Header */}
      <div className="text-center mb-8">
        <span className="text-6xl mb-4 block">{info.icon}</span>
        <h1 className="text-3xl font-bold text-gray-900">{info.name}</h1>
        <p className="text-gray-600 mt-2">{info.description}</p>
      </div>

      {/* Input Area */}
      <div className="bg-white p-6 rounded-xl border border-gray-200 shadow-sm">
        <label className="block text-sm font-medium text-gray-700 mb-2">
          Describe what you need
        </label>
        <textarea
          value={input}
          onChange={(e) => setInput(e.target.value)}
          placeholder={`e.g., ${getPlaceholder(skill || '')}`}
          className="w-full h-32 p-4 border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-dragon-500 resize-none"
        />

        <div className="flex items-center justify-between mt-4">
          <button
            onClick={() => navigate('/skills')}
            className="px-4 py-2 text-gray-600 hover:text-gray-900"
          >
            ← Back to Skills
          </button>

          <button
            onClick={handleExecute}
            disabled={isExecuting || !input.trim()}
            className="flex items-center gap-2 px-6 py-3 bg-dragon-600 text-white rounded-lg hover:bg-dragon-700 disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
          >
            {isExecuting ? (
              <>
                <Loader2 className="animate-spin" size={20} />
                <span>Executing...</span>
              </>
            ) : (
              <>
                <Send size={20} />
                <span>Execute</span>
              </>
            )}
          </button>
        </div>
      </div>

      {/* Result */}
      {result && (
        <div className="mt-6 p-4 bg-gray-50 rounded-lg border border-gray-200">
          <h3 className="font-medium text-gray-900 mb-2">Result</h3>
          <pre className="text-sm text-gray-600 whitespace-pre-wrap">{result}</pre>
        </div>
      )}

      {/* Tips */}
      <div className="mt-8 p-4 bg-blue-50 rounded-lg border border-blue-200">
        <h3 className="font-medium text-blue-900 mb-2">💡 Tips</h3>
        <ul className="text-sm text-blue-800 space-y-1">
          <li>• Be specific about what you want</li>
          <li>• Include relevant context and requirements</li>
          <li>• Mention any constraints or preferences</li>
        </ul>
      </div>
    </div>
  )
}

function getPlaceholder(skill: string): string {
  const placeholders: Record<string, string> = {
    brainstorm: 'Generate ideas for a new mobile app feature',
    design: 'Design a microservices architecture for e-commerce',
    code: 'Create a REST API endpoint for user authentication',
    review: 'Review this code for security issues',
    test: 'Generate unit tests for the user service',
    ship: 'Deploy this application to production',
    debug: 'Fix the memory leak in the data processing module',
    doc: 'Write API documentation for the payment service',
    refactor: 'Refactor this monolithic code into clean architecture',
  }
  return placeholders[skill] || 'Describe your task...'
}
