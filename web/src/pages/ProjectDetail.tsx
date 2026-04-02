import { useParams } from 'react-router-dom'
import { useState, useEffect } from 'react'
import { ArrowLeft, Play, Clock, CheckCircle, XCircle } from 'lucide-react'
import { Link } from 'react-router-dom'

interface Execution {
  id: string
  skill: string
  input: string
  status: 'success' | 'failure' | 'running'
  duration_ms: number
  created_at: string
}

interface Project {
  id: string
  name: string
  description: string
  status: string
  created_at: string
}

export default function ProjectDetail() {
  const { id } = useParams<{ id: string }>()
  const [project, setProject] = useState<Project | null>(null)
  const [executions, setExecutions] = useState<Execution[]>([])

  useEffect(() => {
    // 模拟数据
    setProject({
      id: id || '1',
      name: 'OpenClaw Setup',
      description: 'AI assistant ecosystem with multi-agent architecture',
      status: 'active',
      created_at: '2026-04-01',
    })

    setExecutions([
      {
        id: '1',
        skill: 'brainstorm',
        input: 'Design multi-agent system architecture',
        status: 'success',
        duration_ms: 3200,
        created_at: '2026-04-02 10:30',
      },
      {
        id: '2',
        skill: 'code',
        input: 'Generate agent orchestration code',
        status: 'success',
        duration_ms: 5400,
        created_at: '2026-04-02 11:15',
      },
      {
        id: '3',
        skill: 'test',
        input: 'Test agent communication protocol',
        status: 'failure',
        duration_ms: 2100,
        created_at: '2026-04-02 14:20',
      },
    ])
  }, [id])

  const getSkillIcon = (skill: string) => {
    const icons: Record<string, string> = {
      brainstorm: '💭',
      design: '🎨',
      code: '💻',
      review: '👁️',
      test: '🧪',
      ship: '🚀',
      debug: '🐛',
      doc: '📝',
      refactor: '♻️',
    }
    return icons[skill] || '🔧'
  }

  const getStatusIcon = (status: string) => {
    switch (status) {
      case 'success':
        return <CheckCircle className="text-green-600" size={20} />
      case 'failure':
        return <XCircle className="text-red-600" size={20} />
      case 'running':
        return <Play className="text-blue-600" size={20} />
      default:
        return null
    }
  }

  if (!project) {
    return <div>Loading...</div>
  }

  return (
    <div className="p-8">
      {/* Header */}
      <div className="mb-8">
        <Link
          to="/projects"
          className="flex items-center gap-2 text-gray-600 hover:text-gray-900 mb-4"
        >
          <ArrowLeft size={20} />
          <span>Back to Projects</span>
        </Link>

        <div className="flex items-start justify-between">
          <div>
            <h1 className="text-3xl font-bold text-gray-900">{project.name}</h1>
            <p className="text-gray-600 mt-2">{project.description}</p>
          </div>
          <span
            className={`px-4 py-2 rounded-full text-sm font-medium ${
              project.status === 'active'
                ? 'bg-green-100 text-green-700'
                : 'bg-yellow-100 text-yellow-700'
            }`}
          >
            {project.status}
          </span>
        </div>
      </div>

      {/* Stats */}
      <div className="grid grid-cols-4 gap-6 mb-8">
        <div className="bg-white p-4 rounded-xl border border-gray-200">
          <p className="text-sm text-gray-600">Total Executions</p>
          <p className="text-2xl font-bold text-gray-900">{executions.length}</p>
        </div>
        <div className="bg-white p-4 rounded-xl border border-gray-200">
          <p className="text-sm text-gray-600">Success Rate</p>
          <p className="text-2xl font-bold text-green-600">
            {Math.round(
              (executions.filter((e) => e.status === 'success').length /
                executions.length) *
                100
            )}
            %
          </p>
        </div>
        <div className="bg-white p-4 rounded-xl border border-gray-200">
          <p className="text-sm text-gray-600">Avg Duration</p>
          <p className="text-2xl font-bold text-gray-900">
            {Math.round(
              executions.reduce((acc, e) => acc + e.duration_ms, 0) /
                executions.length /
                1000
            )}
            s
          </p>
        </div>
        <div className="bg-white p-4 rounded-xl border border-gray-200">
          <p className="text-sm text-gray-600">Created</p>
          <p className="text-2xl font-bold text-gray-900">{project.created_at}</p>
        </div>
      </div>

      {/* Execution History */}
      <div>
        <h2 className="text-xl font-bold text-gray-900 mb-4">Execution History</h2>
        <div className="bg-white rounded-xl border border-gray-200 overflow-hidden">
          {executions.map((execution, index) => (
            <div
              key={execution.id}
              className={`p-4 flex items-center justify-between ${
                index !== executions.length - 1 ? 'border-b border-gray-200' : ''
              }`}
            >
              <div className="flex items-center gap-4">
                <span className="text-2xl">{getSkillIcon(execution.skill)}</span>
                <div>
                  <p className="font-medium text-gray-900 capitalize">
                    {execution.skill}
                  </p>
                  <p className="text-sm text-gray-600">{execution.input}</p>
                </div>
              </div>

              <div className="flex items-center gap-6">
                <div className="flex items-center gap-2 text-sm text-gray-600">
                  <Clock size={16} />
                  <span>{(execution.duration_ms / 1000).toFixed(1)}s</span>
                </div>
                {getStatusIcon(execution.status)}
                <span className="text-sm text-gray-500">{execution.created_at}</span>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  )
}
