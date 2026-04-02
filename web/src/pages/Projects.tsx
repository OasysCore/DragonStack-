import { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'
import { Plus, Search, MoreVertical } from 'lucide-react'

interface Project {
  id: string
  name: string
  description: string
  status: 'active' | 'paused' | 'completed'
  created_at: string
  updated_at: string
}

export default function Projects() {
  const [projects, setProjects] = useState<Project[]>([])
  const [searchTerm, setSearchTerm] = useState('')

  useEffect(() => {
    // 模拟数据
    setProjects([
      {
        id: '1',
        name: 'OpenClaw Setup',
        description: 'AI assistant ecosystem with multi-agent architecture',
        status: 'active',
        created_at: '2026-04-01',
        updated_at: '2026-04-02',
      },
      {
        id: '2',
        name: 'AI Video Generator',
        description: 'Automated video creation and publishing system',
        status: 'paused',
        created_at: '2026-03-15',
        updated_at: '2026-03-20',
      },
      {
        id: '3',
        name: 'E-commerce Platform',
        description: 'Full-stack e-commerce solution with microservices',
        status: 'completed',
        created_at: '2026-02-01',
        updated_at: '2026-03-01',
      },
    ])
  }, [])

  const filteredProjects = projects.filter((p) =>
    p.name.toLowerCase().includes(searchTerm.toLowerCase())
  )

  const getStatusColor = (status: string) => {
    switch (status) {
      case 'active':
        return 'bg-green-100 text-green-700'
      case 'paused':
        return 'bg-yellow-100 text-yellow-700'
      case 'completed':
        return 'bg-blue-100 text-blue-700'
      default:
        return 'bg-gray-100 text-gray-700'
    }
  }

  return (
    <div className="p-8">
      {/* Header */}
      <div className="flex items-center justify-between mb-8">
        <div>
          <h1 className="text-3xl font-bold text-gray-900">Projects</h1>
          <p className="text-gray-600 mt-2">Manage your DragonStack projects</p>
        </div>
        <button className="flex items-center gap-2 px-4 py-2 bg-dragon-600 text-white rounded-lg hover:bg-dragon-700 transition-colors">
          <Plus size={20} />
          <span>New Project</span>
        </button>
      </div>

      {/* Search */}
      <div className="relative mb-6">
        <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" size={20} />
        <input
          type="text"
          placeholder="Search projects..."
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
          className="w-full pl-10 pr-4 py-3 border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-dragon-500"
        />
      </div>

      {/* Projects Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        {filteredProjects.map((project) => (
          <Link
            key={project.id}
            to={`/projects/${project.id}`}
            className="bg-white p-6 rounded-xl border border-gray-200 hover:border-dragon-300 hover:shadow-md transition-all"
          >
            <div className="flex items-start justify-between mb-4">
              <div className="p-3 bg-dragon-50 rounded-lg">
                <span className="text-2xl">📁</span>
              </div>
              <button className="text-gray-400 hover:text-gray-600">
                <MoreVertical size={20} />
              </button>
            </div>

            <h3 className="font-semibold text-gray-900 mb-2">{project.name}</h3>
            <p className="text-sm text-gray-600 mb-4 line-clamp-2">
              {project.description}
            </p>

            <div className="flex items-center justify-between">
              <span
                className={`px-3 py-1 rounded-full text-xs font-medium ${getStatusColor(
                  project.status
                )}`}
              >
                {project.status}
              </span>
              <span className="text-xs text-gray-500">
                Updated {project.updated_at}
              </span>
            </div>
          </Link>
        ))}
      </div>
    </div>
  )
}
