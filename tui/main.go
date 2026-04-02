package main

import (
	"fmt"
	"io"
	"os"
	"strings"

	"github.com/charmbracelet/bubbles/list"
	"github.com/charmbracelet/bubbles/spinner"
	"github.com/charmbracelet/bubbles/textinput"
	tea "github.com/charmbracelet/bubbletea"
	"github.com/charmbracelet/lipgloss"
)

// DragonStack 9个技能
type Skill struct {
	Name        string
	Icon        string
	Description string
	Phase       string
}

var skills = []Skill{
	{"brainstorm", "💭", "头脑风暴 - 构思创意", "构思"},
	{"design", "🎨", "架构设计 - 系统设计", "设计"},
	{"code", "💻", "代码生成 - 编写代码", "开发"},
	{"review", "👁️", "代码审查 - 检查质量", "审查"},
	{"test", "🧪", "测试 - 验证功能", "测试"},
	{"ship", "🚀", "发布部署 - 上线运行", "部署"},
	{"debug", "🐛", "调试 - 修复问题", "维护"},
	{"doc", "📝", "文档 - 编写文档", "文档"},
	{"refactor", "♻️", "重构 - 优化代码", "优化"},
}

// 样式定义
var (
	titleStyle = lipgloss.NewStyle().
		Bold(true).
		Foreground(lipgloss.Color("#FF6B6B")).
		Background(lipgloss.Color("#2D3436")).
		Padding(0, 1)

	itemStyle = lipgloss.NewStyle().
		PaddingLeft(2)

	selectedItemStyle = lipgloss.NewStyle().
		PaddingLeft(0).
		Foreground(lipgloss.Color("#00B894")).
		Bold(true)

	descriptionStyle = lipgloss.NewStyle().
		Foreground(lipgloss.Color("#636E72"))

	helpStyle = lipgloss.NewStyle().
		Foreground(lipgloss.Color("#B2BEC3"))
)

// Model 定义
type model struct {
	state       string // "menu", "input", "executing", "result"
	skills      list.Model
	input       textinput.Model
	spinner     spinner.Model
	selected    Skill
	userInput   string
	result      string
	err         error
	width       int
	height      int
}

// 初始化
type errMsg error
type resultMsg string

func initialModel() model {
	// 创建技能列表
	items := make([]list.Item, len(skills))
	for i, skill := range skills {
		items[i] = skillItem(skill)
	}

	l := list.New(items, skillDelegate{}, 30, 14)
	l.Title = "选择龙栈技能 / Select DragonStack Skill"
	l.SetShowStatusBar(false)
	l.SetFilteringEnabled(false)
	l.Styles.Title = titleStyle

	// 创建输入框
	ti := textinput.New()
	ti.Placeholder = "描述你的需求... / Describe your needs..."
	ti.Focus()
	ti.CharLimit = 200
	ti.Width = 50

	// 创建 spinner
	s := spinner.New()
	s.Spinner = spinner.Dot
	s.Style = lipgloss.NewStyle().Foreground(lipgloss.Color("#00B894"))

	return model{
		state:   "menu",
		skills:  l,
		input:   ti,
		spinner: s,
	}
}

func (m model) Init() tea.Cmd {
	return tea.Batch(
		m.spinner.Tick,
	)
}

// 更新逻辑
func (m model) Update(msg tea.Msg) (tea.Model, tea.Cmd) {
	switch msg := msg.(type) {
	case tea.WindowSizeMsg:
		m.width = msg.Width
		m.height = msg.Height
		m.skills.SetWidth(msg.Width)
		return m, nil

	case tea.KeyMsg:
		switch m.state {
		case "menu":
			switch msg.String() {
			case "q", "ctrl+c":
				return m, tea.Quit
			case "enter":
				if i, ok := m.skills.SelectedItem().(skillItem); ok {
					m.selected = Skill(i)
					m.state = "input"
					return m, textinput.Blink
				}
			}

		case "input":
			switch msg.String() {
			case "esc":
				m.state = "menu"
				m.input.SetValue("")
				return m, nil
			case "enter":
				m.userInput = m.input.Value()
				if m.userInput != "" {
					m.state = "executing"
					return m, tea.Batch(
						m.spinner.Tick,
						executeSkill(m.selected, m.userInput),
					)
				}
			}

		case "executing":
			if msg.String() == "ctrl+c" {
				return m, tea.Quit
			}

		case "result":
			switch msg.String() {
			case "q", "ctrl+c":
				return m, tea.Quit
			case "esc", "enter":
				m.state = "menu"
				m.input.SetValue("")
				m.result = ""
				return m, nil
			}
		}

	case resultMsg:
		m.result = string(msg)
		m.state = "result"
		return m, nil

	case errMsg:
		m.err = msg
		m.state = "result"
		return m, nil
	}

	// 更新子组件
	var cmd tea.Cmd
	switch m.state {
	case "menu":
		m.skills, cmd = m.skills.Update(msg)
	case "input":
		m.input, cmd = m.input.Update(msg)
	case "executing":
		m.spinner, cmd = m.spinner.Update(msg)
	}

	return m, cmd
}

// 视图渲染
func (m model) View() string {
	switch m.state {
	case "menu":
		return m.menuView()
	case "input":
		return m.inputView()
	case "executing":
		return m.executingView()
	case "result":
		return m.resultView()
	default:
		return "Unknown state"
	}
}

func (m model) menuView() string {
	header := titleStyle.Render(" 🐉 DragonStack 3.0 ")
	help := helpStyle.Render("↑↓ navigate • enter select • q quit")

	return fmt.Sprintf("\n%s\n\n%s\n\n%s\n",
		header,
		m.skills.View(),
		help,
	)
}

func (m model) inputView() string {
	header := titleStyle.Render(fmt.Sprintf(" %s %s ", m.selected.Icon, m.selected.Name))
	desc := descriptionStyle.Render(m.selected.Description)
	help := helpStyle.Render("enter confirm • esc back")

	return fmt.Sprintf("\n%s\n\n%s\n\n%s\n\n%s\n",
		header,
		desc,
		m.input.View(),
		help,
	)
}

func (m model) executingView() string {
	header := titleStyle.Render(fmt.Sprintf(" %s Executing %s... ", m.spinner.View(), m.selected.Name))
	info := descriptionStyle.Render(fmt.Sprintf("Input: %s", m.userInput))

	return fmt.Sprintf("\n%s\n\n%s\n",
		header,
		info,
	)
}

func (m model) resultView() string {
	if m.err != nil {
		header := titleStyle.Render(" ❌ Error ")
		return fmt.Sprintf("\n%s\n\n%s\n\n%s\n",
			header,
			m.err.Error(),
			helpStyle.Render("esc/enter back • q quit"),
		)
	}

	header := titleStyle.Render(" ✅ Result ")
	content := m.result
	if len(content) > 500 {
		content = content[:500] + "..."
	}

	return fmt.Sprintf("\n%s\n\n%s\n\n%s\n",
		header,
		content,
		helpStyle.Render("esc/enter back • q quit"),
	)
}

// 技能列表项
type skillItem Skill

func (i skillItem) FilterValue() string { return i.Name }

// 列表项样式
type skillDelegate struct{}

func (d skillDelegate) Height() int                             { return 2 }
func (d skillDelegate) Spacing() int                            { return 0 }
func (d skillDelegate) Update(_ tea.Msg, _ *list.Model) tea.Cmd { return nil }

func (d skillDelegate) Render(w io.Writer, m list.Model, index int, listItem list.Item) {
	i, ok := listItem.(skillItem)
	if !ok {
		return
	}

	str := fmt.Sprintf("%s %s\n   %s", i.Icon, i.Name, i.Description)

	fn := itemStyle.Render
	if index == m.Index() {
		fn = func(s ...string) string {
			return selectedItemStyle.Render("> " + strings.Join(s, " "))
		}
	}

	fmt.Fprint(w, fn(str))
}

// 执行技能（模拟）
func executeSkill(skill Skill, input string) tea.Cmd {
	return func() tea.Msg {
		// 这里调用实际的 ds-onto 脚本
		// 简化版本：返回模拟结果
		result := fmt.Sprintf(
			"🐉 DragonStack %s\n\nInput: %s\n\nStatus: Success\n\nOutput would be generated here...",
			skill.Name,
			input,
		)
		return resultMsg(result)
	}
}

func main() {
	p := tea.NewProgram(initialModel(), tea.WithAltScreen())
	if _, err := p.Run(); err != nil {
		fmt.Printf("Error: %v", err)
		os.Exit(1)
	}
}
