import { Link } from 'react-router-dom'

const skills = [
  {
    id: 'brainstorm',
    name: 'Brainstorm',
    icon: '💭',
    description: '头脑风暴 - 构思创意和解决方案',
    phase: '构思',
    color: 'bg-blue-50 border-blue-200',
  },
  {
    id: 'design',
    name: 'Design',
    icon: '🎨',
    description: '架构设计 - 系统架构和数据库设计',
    phase: '设计',
    color: 'bg-purple-50 border-purple-200',
  },
  {
    id: 'code',
    name: 'Code',
    icon: '💻',
    description: '代码生成 - 编写高质量代码',
    phase: '开发',
    color: 'bg-green-50 border-green-200',
  },
  {
    id: 'review',
    name: 'Review',
    icon: '👁️',
    description: '代码审查 - 检查代码质量和规范',
    phase: '审查',
    color: 'bg-yellow-50 border-yellow-200',
  },
  {
    id: 'test',
    name: 'Test',
    icon: '🧪',
    description: '测试 - 生成测试用例和验证',
    phase: '测试',
    color: 'bg-pink-50 border-pink-200',
  },
  {
    id: 'ship',
    name: 'Ship',
    icon: '🚀',
    description: '发布部署 - 部署到生产环境',
    phase: '部署',
    color: 'bg-red-50 border-red-200',
  },
  {
    id: 'debug',
    name: 'Debug',
    icon: '🐛',
    description: '调试 - 诊断和修复问题',
    phase: '维护',
    color: 'bg-orange-50 border-orange-200',
  },
  {
    id: 'doc',
    name: 'Document',
    icon: '📝',
    description: '文档 - 生成README和API文档',
    phase: '文档',
    color: 'bg-cyan-50 border-cyan-200',
  },
  {
    id: 'refactor',
    name: 'Refactor',
    icon: '♻️',
    description: '重构 - 优化代码结构',
    phase: '优化',
    color: 'bg-teal-50 border-teal-200',
  },
]

export default function Skills() {
  return (
    <div className="p-8">
      {/* Header */}
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-gray-900">Skills</h1>
        <p className="text-gray-600 mt-2">
          DragonStack provides 9 AI-powered skills for the complete development lifecycle
        </p>
      </div>

      {/* Skills Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        {skills.map((skill) => (
          <Link
            key={skill.id}
            to={`/execute/${skill.id}`}
            className={`p-6 rounded-xl border-2 hover:shadow-md transition-all ${skill.color}`}
          >
            <div className="flex items-start justify-between mb-4">
              <span className="text-4xl">{skill.icon}</span>
              <span className="px-3 py-1 bg-white rounded-full text-xs font-medium text-gray-600">
                {skill.phase}
              </span>
            </div>

            <h3 className="text-xl font-bold text-gray-900 mb-2">{skill.name}</h3>
            <p className="text-gray-600">{skill.description}</p>

            <div className="mt-4 flex items-center gap-2 text-dragon-600 font-medium">
              <span>Try it</span>
              <span>→</span>
            </div>
          </Link>
        ))}
      </div>

      {/* Workflow Diagram */}
      <div className="mt-12 p-8 bg-white rounded-xl border border-gray-200">
        <h2 className="text-xl font-bold text-gray-900 mb-6">Development Workflow</h2>
        <div className="flex items-center justify-between overflow-x-auto">
          {skills.map((skill, index) => (
            <div key={skill.id} className="flex items-center">
              <div className="flex flex-col items-center">
                <span className="text-2xl mb-2">{skill.icon}</span>
                <span className="text-sm font-medium text-gray-700">{skill.name}</span>
              </div>
              {index < skills.length - 1 && (
                <span className="mx-4 text-gray-400">→</span>
              )}
            </div>
          ))}
        </div>
      </div>
    </div>
  )
}
