import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { FolderOpen, Zap, Activity, Plus } from 'lucide-react'
import axios from 'axios'

interface Project {
  id: string
  name: string
  description: string
  status: string
  created_at: string
}

interface Stats {
  totalProjects: number
  totalExecutions: number
  activeProjects: number
}

export default function Dashboard() {
  const [projects, setProjects] = useState<Project[]>([])
  const [stats, setStats] = useState<Stats>({
    totalProjects: 0,
    totalExecutions: 0,
    activeProjects: 0,
  })

  useEffect(() => {
    // 模拟数据，实际应从 API 获取
    setProjects([
      {
        id: '1',
        name: 'OpenClaw Setup',
        description: 'AI assistant ecosystem',
        status: 'active',
        created_at: '2026-04-01',
      },
      {
        id: '2',
        name: 'AI Video Generator',
        description: 'Automated video creation',
        status: 'paused',
        created_at: '2026-03-15',
      },
    ])
    setStats({
      totalProjects: 12,
      totalExecutions: 156,
      activeProjects: 5,
    })
  }, [])

  const skills = [
    { id: 'brainstorm', name: 'Brainstorm', icon: '💭', color: 'bg-blue-100 text-blue-600' },
    { id: 'design', name: 'Design', icon: '🎨', color: 'bg-purple-100 text-purple-600' },
    { id: 'code', name: 'Code', icon: '💻', color: 'bg-green-100 text-green-600' },
    { id: 'review', name: 'Review', icon: '👁️', color: 'bg-yellow-100 text-yellow-600' },
    { id: 'test', name: 'Test', icon: '🧪', color: 'bg-pink-100 text-pink-600' },
    { id: 'ship', name: 'Ship', icon: '🚀', color: 'bg-red-100 text-red-600' },
  ]

  return (
    <div className="p-8">
      {/* Header */}
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-gray-900">Dashboard</h1>
        <p className="text-gray-600 mt-2">Welcome back! Here's your development overview.</p>
      </div>

      {/* Stats */}
      <div className="grid grid-cols-3 gap-6 mb-8">
        <div className="bg-white p-6 rounded-xl border border-gray-200">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm text-gray-600">Total Projects</p>
              <p className="text-3xl font-bold text-gray-900">{stats.totalProjects}</p>
            </div>
            <div className="p-3 bg-dragon-100 rounded-lg">
              <FolderOpen className="text-dragon-600" size={24} />
            </div>
          </div>
        </div>

        <div className="bg-white p-6 rounded-xl border border-gray-200">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm text-gray-600">Total Executions</p>
              <p className="text-3xl font-bold text-gray-900">{stats.totalExecutions}</p>
            </div>
            <div className="p-3 bg-blue-100 rounded-lg">
              <Zap className="text-blue-600" size={24} />
            </div>
          </div>
        </div>

        <div className="bg-white p-6 rounded-xl border border-gray-200">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm text-gray-600">Active Projects</p>
              <p className="text-3xl font-bold text-gray-900">{stats.activeProjects}</p>
            </div>
            <div className="p-3 bg-green-100 rounded-lg">
              <Activity className="text-green-600" size={24} />
            </div>
          </div>
        </div>
      </div>

      {/* Quick Skills */}
      <div className="mb-8">
        <h2 className="text-xl font-bold text-gray-900 mb-4">Quick Skills</h2>
        <div className="grid grid-cols-6 gap-4">
          {skills.map((skill) => (
            <Link
              key={skill.id}
              to={`/execute/${skill.id}`}
              className="bg-white p-4 rounded-xl border border-gray-200 hover:border-dragon-300 hover:shadow-md transition-all text-center"
            >
              <span className="text-3xl mb-2 block">{skill.icon}</span>
              <span className="font-medium text-gray-900">{skill.name}</span>
            </Link>
          ))}
        </div>
      </div>

      {/* Recent Projects */}
      <div>
        <div className="flex items-center justify-between mb-4">
          <h2 className="text-xl font-bold text-gray-900">Recent Projects</h2>
          <Link
            to="/projects"
            className="text-dragon-600 hover:text-dragon-700 font-medium"
          >
            View All
          </Link>
        </div>

        <div className="bg-white rounded-xl border border-gray-200 overflow-hidden">
          {projects.map((project, index) => (
            <div
              key={project.id}
              className={`p-4 flex items-center justify-between ${
                index !== projects.length - 1 ? 'border-b border-gray-200' : ''
              }`}
            >
              <div>
                <h3 className="font-semibold text-gray-900">{project.name}</h3>
                <p className="text-sm text-gray-600">{project.description}</p>
              </div>
              <div className="flex items-center gap-3">
                <span
                  className={`px-3 py-1 rounded-full text-xs font-medium ${
                    project.status === 'active'
                      ? 'bg-green-100 text-green-700'
                      : 'bg-yellow-100 text-yellow-700'
                  }`}
                >
                  {project.status}
                </span>
                <Link
                  to={`/projects/${project.id}`}
                  className="text-gray-400 hover:text-gray-600"
                >
                  <Plus size={20} />
                </Link>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  )
}
