package main

import (
	"log"
	"net/http"
	"os"
	"os/exec"
	"strings"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/gorilla/websocket"
)

// Skill 定义
type Skill struct {
	ID          string `json:"id"`
	Name        string `json:"name"`
	Icon        string `json:"icon"`
	Description string `json:"description"`
	Phase       string `json:"phase"`
}

var skills = []Skill{
	{"brainstorm", "Brainstorm", "💭", "头脑风暴 - 构思创意", "构思"},
	{"design", "Design", "🎨", "架构设计 - 系统设计", "设计"},
	{"code", "Code", "💻", "代码生成 - 编写代码", "开发"},
	{"review", "Review", "👁️", "代码审查 - 检查质量", "审查"},
	{"test", "Test", "🧪", "测试 - 验证功能", "测试"},
	{"ship", "Ship", "🚀", "发布部署 - 上线运行", "部署"},
	{"debug", "Debug", "🐛", "调试 - 修复问题", "维护"},
	{"doc", "Document", "📝", "文档 - 编写文档", "文档"},
	{"refactor", "Refactor", "♻️", "重构 - 优化代码", "优化"},
}

// Project 定义
type Project struct {
	ID          string    `json:"id"`
	Name        string    `json:"name"`
	Description string    `json:"description"`
	Status      string    `json:"status"`
	CreatedAt   time.Time `json:"created_at"`
	UpdatedAt   time.Time `json:"updated_at"`
}

// Execution 定义
type Execution struct {
	ID          string    `json:"id"`
	ProjectID   string    `json:"project_id"`
	Skill       string    `json:"skill"`
	Input       string    `json:"input"`
	Output      string    `json:"output"`
	Status      string    `json:"status"`
	DurationMs  int       `json:"duration_ms"`
	CreatedAt   time.Time `json:"created_at"`
}

var (
	projects   = make(map[string]*Project)
	executions = make(map[string]*Execution)
	upgrader   = websocket.Upgrader{
		CheckOrigin: func(r *http.Request) bool {
			return true
		},
	}
)

func main() {
	r := gin.Default()

	// CORS
	r.Use(func(c *gin.Context) {
		c.Writer.Header().Set("Access-Control-Allow-Origin", "*")
		c.Writer.Header().Set("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS")
		c.Writer.Header().Set("Access-Control-Allow-Headers", "Content-Type, Authorization")
		if c.Request.Method == "OPTIONS" {
			c.AbortWithStatus(204)
			return
		}
		c.Next()
	})

	// API 路由
	api := r.Group("/api/v1")
	{
		// 技能
		api.GET("/skills", getSkills)
		
		// 项目
		api.GET("/projects", getProjects)
		api.POST("/projects", createProject)
		api.GET("/projects/:id", getProject)
		api.GET("/projects/:id/history", getProjectHistory)
		
		// 执行
		api.POST("/skills/:skill/execute", executeSkill)
		
		// WebSocket
		api.GET("/stream", handleWebSocket)
	}

	// 健康检查
	r.GET("/health", func(c *gin.Context) {
		c.JSON(200, gin.H{"status": "ok"})
	})

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	log.Printf("🐉 DragonStack API Server starting on port %s", port)
	r.Run(":" + port)
}

func getSkills(c *gin.Context) {
	c.JSON(200, gin.H{
		"skills": skills,
	})
}

func getProjects(c *gin.Context) {
	var projectList []*Project
	for _, p := range projects {
		projectList = append(projectList, p)
	}
	c.JSON(200, gin.H{
		"projects": projectList,
	})
}

func createProject(c *gin.Context) {
	var req struct {
		Name        string `json:"name" binding:"required"`
		Description string `json:"description"`
	}

	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(400, gin.H{"error": err.Error()})
		return
	}

	project := &Project{
		ID:          generateID(),
		Name:        req.Name,
		Description: req.Description,
		Status:      "active",
		CreatedAt:   time.Now(),
		UpdatedAt:   time.Now(),
	}

	projects[project.ID] = project

	c.JSON(201, project)
}

func getProject(c *gin.Context) {
	id := c.Param("id")
	project, exists := projects[id]
	if !exists {
		c.JSON(404, gin.H{"error": "Project not found"})
		return
	}

	c.JSON(200, project)
}

func getProjectHistory(c *gin.Context) {
	id := c.Param("id")
	
	var history []*Execution
	for _, e := range executions {
		if e.ProjectID == id {
			history = append(history, e)
		}
	}

	c.JSON(200, gin.H{
		"executions": history,
	})
}

func executeSkill(c *gin.Context) {
	skill := c.Param("skill")
	
	var req struct {
		Input     string `json:"input" binding:"required"`
		ProjectID string `json:"project_id"`
	}

	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(400, gin.H{"error": err.Error()})
		return
	}

	// 异步执行
	go func() {
		startTime := time.Now()
		
		// 调用 ds-onto
		cmd := exec.Command("python3", 
			os.ExpandEnv("$HOME/.openclaw/workspace/skills/dragonstack/scripts/ds-onto.py"),
			req.Input)
		
		output, err := cmd.CombinedOutput()
		
		duration := int(time.Since(startTime).Milliseconds())
		
		execution := &Execution{
			ID:         generateID(),
			ProjectID:  req.ProjectID,
			Skill:      skill,
			Input:      req.Input,
			Output:     string(output),
			Status:     "success",
			DurationMs: duration,
			CreatedAt:  time.Now(),
		}
		
		if err != nil {
			execution.Status = "failure"
			execution.Output += "\nError: " + err.Error()
		}
		
		executions[execution.ID] = execution
	}()

	c.JSON(202, gin.H{
		"message": "Execution started",
		"skill":   skill,
	})
}

func handleWebSocket(c *gin.Context) {
	conn, err := upgrader.Upgrade(c.Writer, c.Request, nil)
	if err != nil {
		log.Printf("WebSocket upgrade failed: %v", err)
		return
	}
	defer conn.Close()

	for {
		var msg struct {
			Type    string `json:"type"`
			Skill   string `json:"skill"`
			Input   string `json:"input"`
		}

		err := conn.ReadJSON(&msg)
		if err != nil {
			log.Printf("WebSocket read error: %v", err)
			break
		}

		if msg.Type == "execute" {
			// 发送开始消息
			conn.WriteJSON(gin.H{
				"type":    "start",
				"skill":   msg.Skill,
				"message": "Execution started",
			})

			// 执行命令
			cmd := exec.Command("python3",
				os.ExpandEnv("$HOME/.openclaw/workspace/skills/dragonstack/scripts/ds-onto.py"),
				msg.Input)
			
			output, err := cmd.CombinedOutput()
			
			if err != nil {
				conn.WriteJSON(gin.H{
					"type":    "error",
					"message": err.Error(),
				})
			} else {
				conn.WriteJSON(gin.H{
					"type":    "complete",
					"output":  string(output),
				})
			}
		}
	}
}

func generateID() string {
	return "ds_" + strings.ToLower(time.Now().Format("20060102150405"))
}
